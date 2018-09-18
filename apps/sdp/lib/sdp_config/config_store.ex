defmodule SDP.Config.Store do
  @moduledoc """
  This module is solely a state management module. It reads in the config
  from a file and keeps the it in the state system for the life cycle
  of the application.
  """
  require Logger
  use Agent

  def start_link(_opts) do
    Logger.info("Starting #{__MODULE__}.")
    Agent.start_link(fn -> SDP.Config.load_config() end, name: __MODULE__)
  end
end
