defmodule MrTest do
  use ExUnit.Case
  doctest Mr

  test "greets the world" do
    assert Mr.hello() == :world
  end
end
