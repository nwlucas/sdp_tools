defmodule SDP.Application do
  @moduledoc """

  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SDP.Config, []),
    ]

    opts = [strategy: :one_for_one, name: SDP.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
