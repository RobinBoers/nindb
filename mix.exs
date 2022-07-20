defmodule NinDB.MixProject do
  use Mix.Project

  def project, do: [
    app: :nindb,
    version: "0.1.0",
    elixir: "~> 1.12",
    start_permanent: Mix.env() == :prod,
    deps: deps(),
    elixirc_paths: elixirc_paths(Mix.env()),
    name: "NinDB",
    source_url: "https://github.com/RobinBoers/nindo-nindb",
    docs: [
      logo: "logo.png",
      source_ref: "master"
    ],
  ]

  def application, do: [
    extra_applications: [:logger],
    mod: {NinDB.Application, []}
  ]

  defp deps, do: [
    {:ecto_sql, "~> 3.0"},
    {:postgrex, ">= 0.0.0"},
    {:jason, "~> 1.2"},
    {:the_big_username_blacklist, "~> 0.1.2"},
    {:html_sanitize_ex, github: "RobinBoers/html-sanitize-ex"},
    {:cloak, "1.1.1"},
    {:cloak_ecto, "~> 1.2"},
    {:ex_doc, "~> 0.24", only: :dev, runtime: false},
  ]

   # Specifies which paths to compile per environment.
   defp elixirc_paths(:test), do: ["lib", "test/support"]
   defp elixirc_paths(_), do: ["lib"]
end
