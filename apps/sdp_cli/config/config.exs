use Mix.Config

# Map pattern `cli sub command` ==> `Module`

config :sdp, submodule_specs: %{ :goals => SDP.Goals, :employee => SDP.Employee}
