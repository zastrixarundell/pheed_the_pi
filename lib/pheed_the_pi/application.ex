defmodule PheedThePi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Delete the RPi folder so the real Raspberry PI module can load
    setup_python!()

    camera = Application.get_env(:picam, :camera, Picam.Camera)

    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      PheedThePiWeb.Endpoint,
      # Starts a worker by calling: PheedThePi.Worker.start_link(arg)
      # {PheedThePi.Worker, arg},
      camera,
      PheedThePi.PythonServer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PheedThePi.Supervisor]
    supervisor = Supervisor.start_link(children, opts)

    set_picam_size!()
    set_image!()
    set_framerate!()

    supervisor
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PheedThePiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp set_picam_size!(), do:
    if Mix.env == :prod, do: Picam.set_size(1920, 0),
      else: Picam.set_size(720, 0)

  defp set_image!(), do:
      Picam.FakeCamera.set_image('assets/static/images/wallpaper.jpg' |> File.read!())

  defp setup_python!() do
    destination =
      [File.cwd!(), ".python"]
      |> Path.join()

      [File.cwd!(), "lib", "python"]
      |> Path.join()
      |> File.cp_r(destination)

    [destination, "erlport"]
      |> Path.join()
      |> File.rm_rf()

    if Mix.env == :prod do
        [destination, "RPi"]
        |> Path.join()
        |> File.rm_rf()
    end
  end

  defp set_framerate!(), do:
    Picam.set_fps(if Mix.env == :prod, do: 60, else: 10)
end
