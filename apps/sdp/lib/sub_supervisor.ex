defmodule SDP.SubSupervisor do
  @moduledoc """
  This module is responsible for creating the supervision tree for most of
  the workhorse sub modules and servers.
  It will be responsible for supervising:
  `SDP.DCN.Writer`
  `SDP.DCN.Creator`
  `SDP.DCN.Copy`
  `SDP.File.Watcher`
  `SDP.File.Archiver`
  `SDP.File.Processor`
  `SDP.Aptos.BI`
  """
  alias SDP.File.Watcher, as: FW
  alias SDP.Config.Store, as: Store
  require Logger
  use Supervisor

  def start_link(_opts) do
    Logger.info("Starting #{__MODULE__}.")
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    gwd = Store.get("goals_watch_dir") |> Path.absname()
    ewd = Store.get("employees_watch_dir") |> Path.absname()

    Logger.info("Watching #{gwd} for Goals")

    children = [
      {FW.Goals, [dirs: [gwd], name: :goals_watcher]},
      {FW.Employees, [dirs: [ewd], name: :employees_watcher]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
