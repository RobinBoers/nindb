defmodule NinDB.Database do
  @moduledoc """
  Module to handle interactions with the Ecto Repo.
  """
  alias NinDB.{Account, Repo}
  alias Ecto.Changeset
  require Ecto.Query

  def compare(schema, id1, id2, key) do
    a = Repo.get(schema, id1)
    b = Repo.get(schema, id2)

    Map.fetch(a, key) == Map.fetch(b, key)
  end

  def put(schema) do
    Account.changeset(schema)
    |> Repo.insert()
  end

  def get(schema, id) do
    Repo.get(schema, id)
  end

  def update(schema, key, value) do
    Changeset.change(schema, [{key, value}])
    |> Repo.update()
  end

  def delete(schema, id) do
    get(schema, id)
    |> Repo.delete()
  end

  def list(schema) do
    Repo.all(schema)
  end

  # Get entries by specific property

  def get_by_username(schema, username) do
    Repo.get_by(schema, username: username)
  end

  def get_by_author(schema, id) do
    Repo.get_by(schema, author_id: id)
  end

end
