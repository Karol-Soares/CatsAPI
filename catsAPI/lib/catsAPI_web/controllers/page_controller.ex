defmodule CatsAPIWeb.PageController do
  use CatsAPIWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
