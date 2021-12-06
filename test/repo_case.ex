defmodule NinDB.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias NinDB.Repo

      import Ecto
      import Ecto.Query
      import NinDB.RepoCase

      alias NinDB.Database
      alias NinDB.{Account, Post, Comment}
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(NinDB.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(NinDB.Repo, {:shared, self()})
    end

    :ok
  end
end
