defmodule SDP.Application do
  @moduledoc """
  This module just serves as the entry point to the application. There is
  nothing specific or too important here. It spawns a Supervisor which
  in turn start the supervision tree. Most of the work and customization
  is there and down.
  """
  use Application

  def start(_type, _args) do
    SDP.Supervisor.start_link(name: SDP.Supervisor)
  end
end
