defmodule Lab1Web.PageView do
  use Lab1Web, :view

  def hn_newest do
    Crawler.get_new_page()
      |> Enum.take(16)
  end

  def hn_hot do
    Crawler.get_job_page()
    |> Enum.take(18)
  end

end
