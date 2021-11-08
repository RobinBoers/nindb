defmodule NinDB.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string, size: 20
    field :display_name, :string, size: 20
    field :password, :string, size: 40
    field :salt, :string, size: 40
    field :profile_picture, :binary
    field :email, :string, size: 40
    field :birth_date, :date
    field :description, :string, size: 150
    field :liked, {:array, :string}, default: []
  end

  def changeset(account, params \\ %{}) do
    account
    |> cast(params, [
        :username,
        :display_name,
        :password,
        :salt,
        :profile_picture,
        :email,
        :birth_date,
        :description,
        :liked
    ])
    |> validate_required([:username, :password, :email, :salt])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:password, min: 4)
  end
end
