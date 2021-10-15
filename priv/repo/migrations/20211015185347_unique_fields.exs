defmodule NinDB.Repo.Migrations.UniqueFields do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:username, :email])
  end
end
