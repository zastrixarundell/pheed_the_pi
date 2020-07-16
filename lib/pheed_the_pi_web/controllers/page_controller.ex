defmodule PheedThePiWeb.PageController do
  use PheedThePiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
