# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :pheed_the_pi, PheedThePiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6zAEYxutXRzLpDbI6ZRkaM3CZ/yvMWU4cZ869Q/+NUoGukQbwzbXcEUdS5kB6wHg",
  render_errors: [view: PheedThePiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PheedThePi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "ls907uAH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# General configuration for PTP
config :pheed_the_pi, :basic_auth,
  username: System.get_env("PHEED_THE_PI_USERNAME") || "username",
  password: System.get_env("PHEED_THE_PI_PASSWORD") || "passw0rd"

  config :pheed_the_pi, PheedThePiWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
