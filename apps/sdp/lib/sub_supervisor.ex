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
  require Logger
  use Supervisor

  def start_link(_opts) do
    Logger.info("Starting #{__MODULE__}.")
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = []
    Supervisor.init(children, strategy: :one_for_one)
  end
end
