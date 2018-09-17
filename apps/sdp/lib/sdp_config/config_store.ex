defmodule SDP.ConfigStore do
  @moduledoc """

  """

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def initialize(pid) do
    Agent.update(pid, fn -> nil end)
  end
end
