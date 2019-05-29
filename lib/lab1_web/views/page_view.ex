defmodule Lab1Web.PageView do
  use Lab1Web, :view

  def hn_newest do
    Crawler.get_new_page()
      |> Enum.take(6)
  end

  def hn_hot do
    Crawler.get_job_page()
    |> Enum.take(8)
  end

end
