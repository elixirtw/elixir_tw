defmodule ElixirTw.Factory do
  @moduledoc """
  ElixirTw test factories
  """

  use ExMachina.Ecto, repo: ElixirTw.Repo

  alias ElixirTw.Account.User
  alias ElixirTw.Account.OAuthInfo
  alias ElixirTw.Board.Post

  def user_factory do
    %User{
      name: Faker.Name.name(),
      email: Faker.Internet.email()
    }
  end

  def oauth_info_factory do
    %OAuthInfo{
      provider: Faker.Company.name(),
      uid: sequence("allyourbasearemy"),
      user: insert(:user)
    }
  end

  def post_factory do
    simple_body = Faker.Lorem.paragraph()

    %Post{
      title: Faker.Lorem.sentence(),
      body: simple_body,
      markdown_body: simple_body,
      user: insert(:user),
      slug: sequence(:slug_time, &"#{&1}-sluged-title")
    }
  end
end
