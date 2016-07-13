defmodule ElixirTw.OauthCommand do
  use ElixirTw.Web, :command

  alias ElixirTw.User
  alias Ueberauth.Auth

  def persist_user({%User{} = user, auth}) do
    user
  end

  def persist_user({nil, auth}) do
    auth
  end
end
