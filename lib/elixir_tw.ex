defmodule ElixirTw do
  @moduledoc nil

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(ElixirTw.Web.Endpoint, []),
      # Start the Ecto repository
      supervisor(ElixirTw.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(ElixirTw.Worker, [arg1, arg2, arg3]),
      worker(GuardianDb.ExpiredSweeper, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTw.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
