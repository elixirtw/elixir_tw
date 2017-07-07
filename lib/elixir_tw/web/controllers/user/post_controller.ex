defmodule ElixirTw.Web.User.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  import PipeTo

  alias ElixirTw.Board.Post

  def new(conn, _params, _user, _claim) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}, %{id: user_id}, _claim) do
    changeset = Map.put(post_params, "user_id", user_id)
                ~> Post.changeset(%Post{}, _)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully")
        |> redirect(to: post_path(conn, :show, post.slug))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong, please recheck your post.")
        |> render("new.html", changeset: changeset)
    end
  end
end
