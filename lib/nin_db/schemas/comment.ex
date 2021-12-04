defmodule NinDB.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:post_id, :parent, :title, :body, :author_id, :datetime]}
  schema "comments" do
    field(:post_id, :integer)
    field(:parent, :integer)
    field(:title, :string, size: 70)
    field(:body, :string, size: 250)
    field(:author_id, :integer)
    field(:datetime, :naive_datetime)
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [
      :post_id,
      :parent,
      :title,
      :body,
      :author_id,
      :datetime
    ])
    |> validate_required([:post_id, :author_id, :title, :body, :datetime])
    |> validate_length(:title, max: 70)
    |> validate_length(:body, max: 250)
  end
end
