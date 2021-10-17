defmodule NinDB.Repo.Migrations.Posts do
  use Ecto.Migration

  def change do
    create table :posts do
      add :author_id, :integer
      add :like_count, :integer
      add :image, :binary
      add :body, :text
      add :title, :text
      add :comments, :map
      add :datetime, :naive_datetime
    end
  end
end
