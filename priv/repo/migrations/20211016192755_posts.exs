defmodule NinDB.Repo.Migrations.Posts do
  use Ecto.Migration

  def change do
    create table :posts do
      add :author_id, :integer
      add :image, :binary
      add :body, :text
      add :title, :text
      add :datetime, :naive_datetime
    end
  end
end
