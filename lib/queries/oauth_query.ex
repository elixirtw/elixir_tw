defmodule ElixirTw.OauthQuery do
  @moduledoc false

  use ElixirTw.Web, :query

  alias ElixirTw.User
  alias ElixirTw.OAuthInfo

  def identify_user(auth) do
    query = from u in User,
            join: o in OAuthInfo,
            on: u.id == o.user_id,
            where: o.uid == ^auth.uid and o.provider == ^Atom.to_string(auth.provider)

    { Repo.one(query), auth }
  end
end
