use Mix.Config

config :nin_db, NinDB.Repo,
  database: "nindb_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
