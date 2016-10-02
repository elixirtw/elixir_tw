defmodule ElixirTw.User.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  alias ElixirTw.Post

  def new(conn, _params, %{id: _user_id}, _claim) do
    changeset = Post.changeset(%Post{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params, user, _claim) do
    
  end
end
