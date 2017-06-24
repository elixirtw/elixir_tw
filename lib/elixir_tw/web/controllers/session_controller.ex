defmodule ElixirTw.Web.SessionController do
  use ElixirTw.Web, :controller

  plug Ueberauth
  plug :scrub_params, "user" when action in [:create]

  alias ElixirTw.OAuthQuery
  alias ElixirTw.OAuthInfo

  def new(conn, params) do
    origin_url = Map.get(params, "origin_url", "/")

    if current_resource(conn) do
      redirect(conn, to: origin_url)
    else
      conn
      |> put_session(:origin_url, origin_url)
      |> render("new.html")
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully")
    |> redirect(to: "/")
  end

  def request(conn, params) do
    render(conn, "request.html", callback_url: "/auth/#{conn.params["provider"]}/callback?origin_url=#{params[:origin_url]}")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "驗證失敗！")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_result = auth
    |> OAuthQuery.identify_user
    |> OAuthInfo.persist_user

    redirect_url = get_session(conn, :origin_url)

    case user_result do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "驗證成功！")
        |> put_session(:current_user, user)
        |> redirect(to: redirect_url)
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end
end
