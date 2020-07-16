defmodule PheedThePiWeb.PageController do
  use PheedThePiWeb, :controller

  import Plug.BasicAuth
  plug :basic_auth, Application.compile_env!(:pheed_the_pi, :basic_auth)

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
