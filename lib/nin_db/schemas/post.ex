defmodule NinDB.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :author_id, :integer
    field :title, :string, size: 70
    field :body, :string, size: 250
    field :image, :binary
    field :like_count, :integer
    field :comments, :map
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [
        :author_id,
        :title,
        :body,
        :image,
        :like_count,
        :comments
      ])
    |> validate_required([:author_id, :title, :body, :like_count, :comments])
    |> validate_length(:title, max: 70)
    |> validate_length(:body, max: 250)
  end
end