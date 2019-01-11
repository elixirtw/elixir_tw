defmodule ElixirTwWeb.User.PostController do
  use ElixirTwWeb, :controller

  alias ElixirTw.Board

  def new(conn, _params, _user, _claim) do
    changeset = Board.post_changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}, user, _claim) do
    case Board.create_post(user, post_params) do
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

  def edit(conn, %{"slug" => slug}, user, _claim) do
    case Board.get_post_by_user(user, slug) do
      nil ->
        conn
        |> put_flash(:error, "不能修改文章")
        |> redirect(to: post_path(conn, :show, slug))

      post ->
        changeset = Board.post_changeset(post)
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def update(conn, %{"post" => post_params}, user, _claim) do
    case Board.update_post(user, post_params["id"], post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "文章成功更新")
        |> redirect(to: post_path(conn, :show, post.slug))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "文章有錯誤")
        |> render("new.html", changeset: changeset)
    end
  end
end
