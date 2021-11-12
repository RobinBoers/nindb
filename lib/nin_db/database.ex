defmodule NinDB.Database do
  @moduledoc """
  Module to handle interactions with the Ecto Repo.
  """
  alias NinDB.{Account, Comment, Friend, Post, Repo}
  import Ecto.Query

  def compare(schema, id1, id2, key) do
    a = Repo.get(schema, id1)
    b = Repo.get(schema, id2)

    Map.fetch(a, key) == Map.fetch(b, key)
  end

  def put(schema, Account) do
    Account.changeset(%Account{}, schema)
    |> Repo.insert()
  end
  def put(schema, Post) do
    Post.changeset(%Post{}, schema)
    |> Repo.insert()
  end
  def put(schema, Comment) do
    Comment.changeset(%Comment{}, schema)
    |> Repo.insert()
  end
  def put(schema, Friend) do
    Friend.changeset(%Friend{}, schema)
    |> Repo.insert()
  end

  def get(schema, id) do
    Repo.get(schema, id)
  end

  def get_all(Account, limit) do
    from(e in Account, limit: ^limit)
    |> Repo.all()
  end
  def get_all(schema, limit) do
    from(e in schema, order_by: [desc: e.datetime], limit: ^limit)
    |> Repo.all()
  end

  def update(schema = %Account{}, key, value) do
    Account.changeset(schema, %{key => value})
    |> Repo.update()
  end
  def update(schema = %Post{}, key, value) do
    Post.changeset(schema, %{key => value})
    |> Repo.update()
  end
  def update(schema = %Comment{}, key, value) do
    Comment.changeset(schema, %{key => value})
    |> Repo.update()
  end
  def update(schema = %Friend{}, key, value) do
    Friend.changeset(schema, %{key => value})
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

  def get_by(:username, schema, username) do
    Repo.get_by(schema, username: username)
  end
  def get_by(:author, schema, id) do
    schema |> where(author_id: ^id) |> Repo.all()
  end
  def get_by(:parent, schema, id) do
    schema |> where(parent: ^id) |> Repo.all()
  end
  def get_by(:post, schema, id) do
    schema |> where(post_id: ^id) |> Repo.all()
  end
  def get_by(:user_id, schema, id) do
    schema |> where(user_id: ^id) |> Repo.all()
  end
  def get_by(:friend, schema, id) do
    schema |> where(friend_id: ^id) |> Repo.all()
  end
end
