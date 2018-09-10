defmodule SDP.EmployeeTest do
  use ExUnit.Case
  doctest SDP.Employee

  test "greets the world" do
    assert SDP.Employee.hello() == :world
  end
end
