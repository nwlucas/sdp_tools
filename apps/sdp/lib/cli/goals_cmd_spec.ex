defmodule SDP.Goals.CmdSpec do
@moduledoc """
Command Spec for `sdp goals` module
"""

  def spec do
    {
      :goals, [
        name: "goals",
        about: "Process sales goals files and sends them down to stores",
        allow_unkown_args: false,
        parse_double_dash: true,
        options: [
          month: [
            value_name: "GOALS_MONTH",
            short: "-m",
            long: "--month",
            help: "Specify a month to run. Default behaviour is to run for the month coming up.",
            required: false,
            parser: :integer,
            default: &Date.utc_today/0
          ],
          file: [
            value_name: "GOALS_FILE",
            short: "-f",
            long: "--file",
            help: "Specify a file to run.",
            required: false,
            parser: :string,
            default: ""
          ],
          path: [
            value_name: "GOALS_PATH",
            short: "-p",
            long: "--path",
            help: "Specify a path to look for multiple files and process them.",
            required: false,
            parser: :string,
            default: ""
          ],
        ]
      ]
    }
  end
end
