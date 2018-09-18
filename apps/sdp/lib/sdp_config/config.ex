defmodule SDP.Config do
  @moduledoc """
  Module stub is a convenience to read one variable from the environment
  on load and then to read in the config file with all other settings.

  This module is called from `SDP.Config.Store` where the results of
  the load are injected into a Agent for state management.
  """
  require Logger

  @on_load :read_env
  @sdp_conf_file "sdp.toml"

  def read_env() do
    Logger.debug("Checking for config file environment variable.")

    conf_file =
      "SDP_CONFIG"
      |> System.get_env()
      |> String.trim()
      |> Path.expand()
      |> Path.join(@sdp_conf_file)

    Logger.debug("Conf file path is: #{conf_file}")
    Application.put_env(:sdp, :sdp_config_file, conf_file)
  end

  def load_config() do
    file = Application.get_env(:sdp, :sdp_config_file)

    cond do
      String.length(file) == 0 ->
        default_config() |> Toml.decode()

      File.exists?(file) ->
        Toml.decode_file(file)

      true ->
        default_config() |> Toml.decode()
    end
  end

  defp default_config() do
    """
    """
  end
end
