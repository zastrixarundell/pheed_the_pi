defmodule PheedThePiWeb.PageController do
  use PheedThePiWeb, :controller

  import Plug.BasicAuth

  @username Application.get_env(:pheed_the_pi, :basic_auth)[:username]
  @password Application.get_env(:pheed_the_pi, :basic_auth)[:password]
  plug :basic_auth, username: @username, password: @password

  @sentences [
    "What?! This works?!",
    "Entering campaign...",
    "Well... this is radical!",
    "One might say this is super-slavic.",
    "Loading Skyrim 2, thanks Todd.",
    "One does not simply walk in-... Ugh I quit.",
    "Loading Twitch's retarded cousin..."
  ]

  def index(conn, _params) do
    render(conn, "index.html", message: Enum.random(@sentences))
  end
end
