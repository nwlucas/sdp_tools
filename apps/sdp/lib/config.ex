defmodule SDP.Core.Config do
  @moduledoc """

  """
  use GenServer

  def start_link() do
    start_link([])
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  # Public API
  @doc """
  Return current config
  """
  def config() do
    GenServer.call(__MODULE__, :current_config)
  end

  @doc """
  Fetch a value for the key section in a config file
  """
  def lookup(key) do
    GenServer.call(__MODULE__, {:lookup, key})
  end

  @doc """
  Fetch a value for the key section in a config file
  """
  def sighup() do
    GenServer.call(__MODULE__, :read_config)
  end

  # Private API
  def init(_args) do
    {:ok, load_config()}
  end

  def handle_call(:current_config, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:lookup, key}, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:read_config, _from, state) do
    config = load_config()
    {:reply, config, state}
  end

  def handle_call(_message, _from, state) do
    {:reply, state}
  end

  defp load_config() do
  end
end
