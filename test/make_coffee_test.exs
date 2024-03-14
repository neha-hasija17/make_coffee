defmodule MakeCoffeeTest do
  use ExUnit.Case
  doctest MakeCoffee

  test "greets the world" do
    assert MakeCoffee.hello() == :world
  end
end
