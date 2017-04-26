defmodule ElixirTw.OAuthCommand do
  @moduledoc false

  use ElixirTw.Web, :command

  alias ElixirTw.User

  def persist_user({%User{} = user, _}) do
    {:ok, user}
  end

  def persist_user({nil, auth}) do
    Repo.transaction fn ->
      User.changeset(%User{}, %{name: auth.info.name || auth.info.nickname, email: auth.info.email})
      |> Repo.insert!
      |> Ecto.build_assoc(:oauth_infos, %{provider: Atom.to_string(auth.provider), uid: auth.uid})
      |> Repo.insert!
    end
  end
end
