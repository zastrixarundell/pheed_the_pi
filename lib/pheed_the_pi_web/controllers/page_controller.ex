defmodule PheedThePiWeb.PageController do
  use PheedThePiWeb, :controller

  import Plug.BasicAuth

  @username Application.get_env(:pheed_the_pi, :basic_auth)[:username]
  @password Application.get_env(:pheed_the_pi, :basic_auth)[:password]
  plug :basic_auth, username: @username, password: @password

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
