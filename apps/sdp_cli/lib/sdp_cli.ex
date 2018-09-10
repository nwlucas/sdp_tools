defmodule SDP.Cli do
  @moduledoc """
  Command Spec for `sdp` root module
  """
  @submodule_specs Application.get_env(:sdp, :submodule_specs)

  def main(argv) do
    Optimus.new!(
      name: "SDP",
      description: "Store DCN Processor",
      version: "0.1.0",
      author: "Nigel Williams-Lucas",
      allow_unknown_args: false,
      parse_double_dash: true,
      subcommands: submodules()
    ) |> Optimus.parse!(argv)
  end

  #Load Submodule specs defined in config `submodule_specs`
  defp submodules do
    @submodule_specs
    |> Enum.map(fn {_, v} -> apply(Module.concat([v, "CmdSpec"]), :spec, []) end)
    |> List.flatten
  end
end
