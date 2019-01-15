defmodule ElixirTw.AccountTest do
  use ElixirTw.DataCase, async: true

  alias ElixirTw.Account

  describe "get_user/1" do
    setup do
      %{user: insert(:user)}
    end

    @tag :pending
    test "find user with integer id", context do
      user = Account.get_user(context.user.id)

      assert user
      assert user == context.user
    end
  end

  describe "get_user/2" do
    setup do
      oauth = insert(:oauth_info)
      %{user: oauth.user, oauth: oauth}
    end

    test "find user with string oauth token", context do
      user = Account.get_user(context.oauth.provider, context.oauth.uid)

      assert user
      assert user == context.user
    end
  end

  describe "create_user_with_oauth/2" do
    setup do
      auth_stub = %Ueberauth.Auth{
        info: %Ueberauth.Auth.Info{
          description: nil,
          email: "bogus@mail.com",
          first_name: nil,
          image: "http://graph.facebook.com/0000000000000000/picture?type=square",
          last_name: nil,
          location: nil,
          name: "Banana Man",
          nickname: nil,
          phone: nil,
          urls: %{facebook: nil, website: nil}
        },
        provider: :facebook,
        strategy: Ueberauth.Strategy.Facebook,
        uid: 10_157_894_562_480_206
      }

      %{oauth_stub: auth_stub}
    end

    test "if user is present in tuple, returns success tuple", context do
      user = insert(:user)

      assert {:ok, user_1} = Account.create_user_with_oauth(user, context.oauth_stub)
      assert user_1 == user
    end

    test "if user is not found, creates a new user from oauth info", context do
      assert {:ok, user} = Account.create_user_with_oauth(nil, context.oauth_stub)
      assert user.id
    end
  end
end
