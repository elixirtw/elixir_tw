defmodule ElixirTw.OauthAuthentication do
  use ElixirTw.Web, :query

  alias ElixirTw.User
  alias ElixirTw.OauthCredential

  def identify_user(auth) do
    query = from u in User,
            join: o in OauthCredential,
            where: o.provider_id == ^auth.uid and o.provider_name == ^auth.provider
    require IEx; IEx.pry

    #Repo.all query
  end
end
