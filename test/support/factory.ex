defmodule ElixirTw.Factory do
  @moduledoc """
  ElixirTw test factories
  """

  use ExMachina.Ecto, repo: ElixirTw.Repo

  alias ElixirTw.Account.User
  alias ElixirTw.Account.OAuthInfo

  def user_factory do
    %User{
      name: Faker.Name.name,
      email: Faker.Internet.email
    }
  end

  def oauth_info_factory do
    %OAuthInfo{
      provider: Faker.Company.name,
      uid: sequence("allyourbasearemy"),
      user: insert(:user)
    }
  end
end
