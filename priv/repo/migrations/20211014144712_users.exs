defmodule NinDB.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table :users do
      add :username, :string, size: 20
      add :display_name, :string, size: 20
      add :password, :string, size: 40
      add :profile_picture, :binary
      add :email, :string, size: 20
      add :birth_date, :date
      add :description, :string, size: 150
    end
  end
end
