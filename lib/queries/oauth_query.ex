defmodule ElixirTw.OauthQuery do
  use ElixirTw.Web, :query

  alias ElixirTw.User
  alias ElixirTw.OauthProvider

  def identify_user(auth) do
    query = from u in User,
            join: o in OauthProvider,
            where: o.uid == ^auth.uid and o.provider == ^Atom.to_string(auth.provider)

    { Repo.one(query), auth }
  end
end
