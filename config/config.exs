# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_mon_api,
  ecto_repos: [ExMonApi.Repo]

# Configures the endpoint
config :ex_mon_api, ExMonApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9XDF3wt7vpoM3Nv3ildtBH68DvYi0pbOLkz4BK9nEzPpV54tPbJxz5LIEeqWHyKU",
  render_errors: [view: ExMonApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMonApi.PubSub,
  live_view: [signing_salt: "VeixArNY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Configures Guardian
config :ex_mon_api, ExMonApiWeb.Auth.Guardian,
  issuer: "ex_mon_api",
  # "Secret key. You can use `mix guardian.gen.secret` to get one"
  secret_key: "pFDj4/YvzHjbWM0EBKxIbBGHILy8ibb6WvLzB1LhuWTyvjih/U4/m2tdOUlA2Bla"
