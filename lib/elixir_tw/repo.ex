defmodule ElixirTw.Repo do
  use Ecto.Repo,
    otp_app: :elixir_tw,
    adapter: Ecto.Adapters.Postgres
end
