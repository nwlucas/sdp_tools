defmodule SDP.Employee.CmdSpec do
  @moduledoc """
  Command Spec for `sdp employee` module
  """

  def spec do
    {
      :employee, [
        name: "employee",
        about: "Process Employee files",
        allow_unkown_args: false,
        parse_double_dash: true,
        options: [
          file: [
            value_name: "EMPLOYEE_FILE",
            short: "-f",
            long: "--file",
            help: "Specify a file to run.",
            required: false,
            parser: :string,
            default: ""
          ]
        ]
      ]
    }
  end
end
