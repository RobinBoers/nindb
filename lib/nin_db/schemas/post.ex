defmodule NinDB.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :author_id, :integer
    field :title, :string, size: 70
    field :body, :string, size: 250
    field :image, :binary
    field :datetime, :naive_datetime
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [
        :author_id,
        :title,
        :body,
        :image,
        :datetime,
      ])
    |> validate_required([:author_id, :title, :body, :datetime])
    |> validate_length(:title, max: 70)
    |> validate_length(:body, max: 250)
  end
end
