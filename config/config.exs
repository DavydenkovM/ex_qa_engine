# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ex_qa_engine,
  ecto_repos: [ExQaEngine.Repo]

# Configures the endpoint
config :ex_qa_engine, ExQaEngineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CE4/pwXTFAWA/ZIdVAzgKSUtWc7AFMnwZgT2bqojuLmitDOnL9x6vojkczPIDVTb",
  render_errors: [view: ExQaEngineWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ExQaEngine.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :cors_plug,
  expose: ["X-Total-Count"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
