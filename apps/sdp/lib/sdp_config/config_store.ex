defmodule SDP.ConfigStore do
  @moduledoc """
  This module is solely a state management module. It reads in the config
  from a file and keeps the it in the state system for the life cycle
  of the application.
  """
  require Logger
  use Agent

  def start_link(_opts) do
    Logger.info("Starting #{__MODULE__}.")
    Agent.start_link(fn -> load_config() end, name: __MODULE__)
  end

  defp load_config() do
    config_path = System.get_env("SDP_CONFIG")

    cond do
      String.length(String.trim(config_path)) == 0 ->
        Toml.decode("")

      String.length(String.trim(config_path)) != 0 ->
        Toml.decode(config_path)
    end
  end
end
