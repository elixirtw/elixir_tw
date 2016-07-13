defmodule ElixirTw.OauthAuthentication do
  use ElixirTw.Web, :query

  alias ElixirTw.User
  alias ElixirTw.OauthInfo

  def identify_user(auth) do
    query = from u in User,
            join: o in OauthInfo,
            where: o.uid == ^auth.uid and o.provider == ^Atom.to_string(auth.provider)

    query
    |> Repo.all
  end
end
