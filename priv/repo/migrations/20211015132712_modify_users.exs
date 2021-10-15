defmodule NinDB.Repo.Migrations.ModifyUsers do
  use Ecto.Migration

  def change do
    alter table :users do
      modify :username, :text
      modify :display_name, :text
      modify :password, :text
      modify :email, :text
      modify :description, :text
    end
  end
end
