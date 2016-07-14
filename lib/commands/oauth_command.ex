defmodule ElixirTw.OauthCommand do
  use ElixirTw.Web, :command

  alias ElixirTw.User
  alias ElixirTw.OauthInfo
  alias Ueberauth.Auth

  def persist_user({%User{} = user, auth}) do
    {:ok, user}
  end

  def persist_user({nil, auth}) do
    Repo.transaction fn ->
      User.changeset(%User{}, %{name: auth.info.name, email: auth.info.email})
      |> Repo.insert!
      |> Ecto.build_assoc(:oauth_infos, %{provider: Atom.to_string(auth.provider), uid: auth.uid})
      |> Repo.insert!
    end
  end
end
