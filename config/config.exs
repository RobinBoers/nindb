import Config

config :nindb,
   ecto_repos: [NinDB.Repo]

config :nindb, NinDB.Repo,
  database: "nindb",
  hostname: "localhost"
