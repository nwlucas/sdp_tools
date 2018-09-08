defmodule Sdp.MixProject do
  @moduledoc false
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10.0"},
      {:credo, "~> 0.10.0", only: [:dev, :test], runtime: false}
    ]
  end
end
