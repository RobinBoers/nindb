defmodule NinDB.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table :users do
      add :username, :text
      add :display_name, :text
      add :password, :text
      add :profile_picture, :binary
      add :email, :text
      add :birth_date, :date
      add :description, :text
      add :liked, {:array, :integer}
    end

    create unique_index(:users, [:username, :email])
  end
end
