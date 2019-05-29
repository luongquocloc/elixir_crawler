defmodule Crawler do
  def client_spec do
    headers = []
    SlowScraper.client_spec(:hn, headers, Crawler.HTTP)
  end

  def get_new_page() do
    SlowScraper.request_page(:hn, "https://news.ycombinator.com/newest", 15_000, 250, 5000)
    |> parse_new()
  end

  def get_job_page() do
    SlowScraper.request_page(:hn, "https://news.ycombinator.com/jobs", 15_000, 250, 5000)
    |> parse_new()
  end

  def parse_new(hn_page) do
    Floki.find(hn_page, ".athing")
    |> Enum.map(fn new_item ->
        link = Floki.find(new_item, ".storylink")
        title = Floki.text(link)
        href = Floki.attribute(link, "href") |> List.first()
        %{
          title: title,
          url: href,          
        }
      end)
  end

  defmodule HTTP do
    require Logger
    @behaviour SlowScraper.Adapter
    def scrape(headers, url) do
      Logger.info("Req #{url}")
      
      ##get struct response :body
      {:ok, response} = HTTPoison.get(url, headers, [])      
      
      ## same below body = Map.get(response, :body)
      %HTTPoison.Response{body: body} = response
      #body = Map.get(response, :body)
      Floki.find(body, "#hnmain")
      #Logger.info(inspect(res))
    end
    
  end

end