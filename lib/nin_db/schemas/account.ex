defmodule NinDB.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @restricted_usernames ["external", "nindo", "blog"]

  schema "users" do
    field :username, :string, size: 20
    field :display_name, :string, size: 20
    field :password, :string, size: 40
    field :salt, :string, size: 40
    field :profile_picture, :binary
    field :email, :string, size: 40
    field :birth_date, :date
    field :description, :string, size: 150
    field :feeds, {:array, :map}, default: []
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
        :feeds,
    ])
    |> validate_required([:username, :password, :email, :salt])
    |> validate_format(:email, ~r/@/)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:password, min: 4)
    |> downcase_username()
    |> validate_username()
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> unique_constraint([:username, :email])
    |> unique_constraint([:email, :username])
  end

  defp downcase_username(changeset) do
    update_change(changeset, :username, &String.downcase/1)
  end

  def validate_username(changeset, _options \\ []) do
    validate_change(changeset, :username, fn _, username ->
      case TheBigUsernameBlacklist.valid?(username, @restricted_usernames) do
        true -> []
        false -> [{:username, "has invalid format"}]
      end
    end)
  end
end
