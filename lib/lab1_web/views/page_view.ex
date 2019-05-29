defmodule Lab1Web.PageView do
  use Lab1Web, :view

  def hn_newest do
    Crawler.get_new_page()
  end

  def hn_hot do
    Crawler.get_job_page()
  end

end
