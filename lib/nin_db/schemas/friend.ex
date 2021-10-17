defmodule NinDB.Friend do
  use Ecto.Schema
  import Ecto.Changeset

  schema "friends" do
    field :user_id, :integer
    field :friend_id, :integer
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [
        :user_id,
        :friend_id
    ])
    |> validate_required([:user_id, :friend_id])
  end
end
