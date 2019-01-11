defmodule ElixirTw.Account do
  @moduledoc nil

  use ElixirTwWeb, :context

  alias ElixirTw.Account.User
  alias ElixirTw.Account.OAuthInfo

  @type oauth_result :: Ueberauth.Auth.t()

  @spec get_user(user_id :: integer) :: User.t() | nil
  def get_user(user_id), do: Repo.get(User, user_id)

  @spec get_user(provider :: atom | String.t(), uid :: String.t()) :: User.t() | nil
  def get_user(provider, uid) when is_atom(provider) do
    get_user(Atom.to_string(provider), uid)
  end

  def get_user(provider, uid) do
    query =
      from u in User,
        join: o in OAuthInfo,
        on: u.id == o.user_id,
        where: o.uid == ^uid and o.provider == ^provider

    Repo.one(query)
  end

  @spec create_user_with_oauth(User.t() | nil, oauth_result) :: {:ok, User.t()} | {:error, any}
  def create_user_with_oauth(%User{} = user, _) do
    {:ok, user}
  end

  def create_user_with_oauth(nil, auth) do
    Repo.transaction(fn ->
      User.changeset(%User{}, %{
        name: auth.info.name || auth.info.nickname,
        email: auth.info.email
      })
      |> Repo.insert!()
      |> Ecto.build_assoc(:oauth_infos, %{provider: Atom.to_string(auth.provider), uid: auth.uid})
      |> Repo.insert!()
    end)
  end
end
