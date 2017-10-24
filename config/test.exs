use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_qa_engine, ExQaEngineWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ex_qa_engine, ExQaEngine.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "davydenkovm",
  password: "davydenkovm",
  database: "ex_qa_engine_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
