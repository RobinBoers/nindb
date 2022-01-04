defmodule NinDBTest do
  use ExUnit.Case
  use NinDB.RepoCase

  doctest NinDB

  test "greets the world" do
    assert NinDB.hello() == :world
  end
end
