use Mix.Config

config :nindb, NinDB.Repo,
  database: "nindb_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
