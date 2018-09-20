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

    conf_path = System.get_env("SDP_CONFIG")

    case conf_path do
      nil ->
        Application.put_env(:sdp, :sdp_config_file, "")

      "" ->
        Application.put_env(:sdp, :sdp_config_file, "")

      _ ->
        Application.put_env(
          :sdp,
          :sdp_config_file,
          Path.join(Path.absname(String.trim(conf_path)), @sdp_conf_file)
        )
    end
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
    dcn_dir = "./DCNS"
    generate_bi = false

    [[goals_watch_dirs]]
    path = "./goals"

    [[employees_watch_dirs]]
    path = "./employees"
    """
  end
end
