defmodule Lab1Web.PageController do
  use Lab1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
