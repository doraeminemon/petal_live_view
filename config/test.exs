import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

if System.get_env("CI") do
  config :petal_live_view, PetalLiveView.Repo,
    url: "postgres://postgres:postgres@postgres:5432/utility_test#{System.get_env("MIX_TEST_PARTITION")}",
    pool: Ecto.Adapters.SQL.Sandbox
else
  config :petal_live_view, PetalLiveView.Repo,
    database: "petal_live_view_test#{System.get_env("MIX_TEST_PARTITION")}",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :petal_live_view, PetalLiveViewWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
