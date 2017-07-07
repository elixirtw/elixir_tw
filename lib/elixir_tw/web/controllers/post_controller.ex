defmodule ElixirTw.Web.PostController do
  use ElixirTw.Web, :controller

  alias ElixirTw.Board
  alias ElixirTw.Board.Post

  def index(conn, _params) do
    posts = Board.get_posts
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    post = Board.get_post(slug, preload: :user)
    render(conn, "show.html", post: post)
  end
end
