defmodule PheedThePiWeb.Router do
  use PheedThePiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PheedThePiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/video.mjpg", PheedThePiWeb.CameraStreamer

  # Other scopes may use custom stacks.
  # scope "/api", PheedThePiWeb do
  #   pipe_through :api
  # end
end
