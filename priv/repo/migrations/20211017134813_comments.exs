defmodule NinDB.Repo.Migrations.Comments do
  use Ecto.Migration

  def change do
    create table :comments do
      add :post_id, :integer
      add :parent, :integer
      add :title, :string, size: 70
      add :body, :string, size: 250
      add :author_id, :integer
      add :datetime, :naive_datetime
    end
  end
end
