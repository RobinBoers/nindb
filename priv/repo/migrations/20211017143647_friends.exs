defmodule NinDB.Repo.Migrations.Friends do
  use Ecto.Migration

  def change do
    create table :friends do
      add :user_id, :integer
      add :friend_id, :integer
    end
  end
end
