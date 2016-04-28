ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElixirTw.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElixirTw.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElixirTw.Repo)

