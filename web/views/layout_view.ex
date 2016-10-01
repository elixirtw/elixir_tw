defmodule ElixirTw.LayoutView do
  use ElixirTw.Web, :view

  def show_flash(conn) do
    conn
    |> get_flash
    |> Enum.map(&flash_html/1)
  end

  def flash_html({level, message}), do: {:safe, "<div class='ui #{level} message'> <i class='close icon'></i> #{message} </div>"}
  def flash_html(_), do: nil

  def avatar_url(conn, %ElixirTw.User{email: email}), do: Gravity.image(email, d: "#{ElixirTw.Router.Helpers.url(conn)}/images/elixir_taiwan_small.png")
  def avatar_url(conn, _), do: "/images/elixir_taiwan_small.png"
end
