defmodule NinDB.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string, size: 20
    field :display_name, :string, size: 20
    field :password, :string, size: 40
    field :profile_picture, :binary
    field :email, :string, size: 20
    field :birth_date, :date
    field :description, :string, size: 150
  end

  def changeset(account, params \\ %{}) do
    account
    |> cast(params, [
        :username,
        :display_name,
        :password,
        :profile_picture,
        :email,
        :birth_date,
        :description
      ])
    |> validate_required([:username, :password, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
