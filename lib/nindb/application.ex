defmodule NinDB.Application do
  @moduledoc false

  use Application

  @children [
    NinDB.Repo,
    NinDB.Vault
  ]
  @opts [strategy: :one_for_one, name: NinDB.Supervisor]

  @impl true
  def start(_type, _args), do: Supervisor.start_link(@children, @opts)
end
