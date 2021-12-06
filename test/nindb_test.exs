defmodule NinDBTest do
  use ExUnit.Case
  doctest NinDB

  alias NinDB.Database
  alias NinDB.{Account, Post, Comment}

  test "puts data in db" do
    Database.put(%{username: "robin", password: "password123", salt: "abc", email: "noreply@geheimesite.nl"}, Account)
  end

end
