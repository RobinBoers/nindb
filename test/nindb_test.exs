defmodule NinDBTest do
  use ExUnit.Case
  use NinDB.RepoCase

  alias NinDB.{Account}
  alias NinDB.Database

  test "put account" do
    account = %{
      username: "robin",
      email: "something that isn't a emailaddress",
      password: "password123",
      salt: "abc",
    }

    assert Database.put(account, Account) == {:ok, account}
  end
end
