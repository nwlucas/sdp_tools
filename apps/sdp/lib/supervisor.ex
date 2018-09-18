defmodule SDP.Supervisor do
  @moduledoc """
  This module is responsible for creating the top level supervision tree.
  It will be responsible for supervising:
  `SDP.ConfigStore`
  `SDP.SubSupervisor`

  This allows for the configuration state to be independent of any of the
  subprocesses and also allow those same subprocesses to access the
  configuration should they crash and restart.
  """
  require Logger
  use Supervisor

  def start_link(_opts) do
    Logger.info("Starting #{__MODULE__}.")
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    children = [
      SDP.ConfigStore,
      SDP.SubSupervisor
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
