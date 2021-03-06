# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :petal_live_view,
  ecto_repos: [PetalLiveView.Repo]

# Configures the endpoint
config :petal_live_view, PetalLiveViewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rQRP/j3RkvaPk6NcMaNmAifMzy19/BRrAJHZObDJMHAzxzfpVv6dJsI3Mjw07LUl",
  render_errors: [view: PetalLiveViewWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PetalLiveView.PubSub,
  live_view: [signing_salt: "tail8oyy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
