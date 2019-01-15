defmodule ElixirTwWeb.SessionControllerTest do
  use ElixirTwWeb.ConnCase
  alias ElixirTw.Account.User
  alias ElixirTwWeb.SessionController

  @ueberauth_auth %{
    credentials: %{token: "fdsnoafhnoofh08h38h"},
    info: %{email: "bob@example.com", name: "Bob"},
    provider: :github,
    uid: 12_345_678
  }

  # Reference to https://github.com/ueberauth/ueberauth_example/issues/22
  test "creates user from github information", %{conn: conn} do
    conn =
      conn
      |> bypass_through(ElixirTwWeb.Router, [:browser])
      |> assign(:ueberauth_auth, @ueberauth_auth)
      |> get("/auth/github/callback")
      |> put_session(:origin_url, "/")
      |> SessionController.callback(%{})

    users = Repo.all(User)
    assert Enum.count(users) == 1
    assert get_flash(conn, :info) == "驗證成功！"
  end

  test "DELETE /logout", %{conn: conn} do
    conn = delete(conn, "/logout")

    assert redirected_to(conn, 302) == "/"
    assert get_flash(conn, :info) == "Logged out successfully"
  end
end
