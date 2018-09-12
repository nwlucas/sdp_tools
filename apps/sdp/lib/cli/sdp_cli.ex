defmodule SDP.Cli do
  @moduledoc """
  Command Spec for `sdp` root module
  """
  @submodule_specs Application.get_env(:sdp, :submodule_specs)

  @doc """
  Main entry point for the `SDP.Cli`

  It consumes arguments and passes the down to the Optimus library.
  Any errors and crashes will be handled there and no here.

  Subcommands are registered here in this function though the code
  for each subcommand lives in their own files and modules.
  """
  @spec main(any()) :: no_return()
  def main(argv) do
    SDP.Application.start(:normal, [])

    Optimus.new!(
      name: "SDP",
      description: "Store DCN Processor",
      version: "0.1.0",
      author: "Nigel Williams-Lucas",
      allow_unknown_args: false,
      parse_double_dash: true,
      subcommands: submodules()
    )
    |> Optimus.parse!(argv)
  end

  # Load Submodule specs defined in config `submodule_specs`
  defp submodules do
    @submodule_specs
    |> Enum.map(fn {_, v} -> apply(Module.concat([v, "CmdSpec"]), :spec, []) end)
    |> List.flatten()
  end
end
