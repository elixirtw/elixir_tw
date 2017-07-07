defmodule ElixirTw.Web.User.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  alias ElixirTw.Board

  def new(conn, _params, _user, _claim) do
    changeset = Board.post_changeset
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}, %{id: user_id}, _claim) do
    case Board.create_post(post_params, user_id) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "文章成功建立")
        |> redirect(to: post_path(conn, :show, post.slug))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "文章有錯誤")
        |> render("new.html", changeset: changeset)
    end
  end
end
