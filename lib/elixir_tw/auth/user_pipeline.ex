defmodule ElixirTw.Auth.UserPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :elixir_tw,
    error_handler: ElixirTw.Auth.UserErrorHandler,
    module: ElixirTw.Auth.Guardian

  plug Guardian.Plug.VerifySession, key: :user
  plug Guardian.Plug.LoadResource, allow_blank: true
end
