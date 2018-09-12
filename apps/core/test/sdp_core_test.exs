defmodule SDP.CoreTest do
  use ExUnit.Case
  doctest SDP.Core

  test "greets the world" do
    assert SDP.Core.hello() == :world
  end
end
