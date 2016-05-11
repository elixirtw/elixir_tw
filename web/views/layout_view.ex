defmodule ElixirTw.LayoutView do
  use ElixirTw.Web, :view

  def show_flash(conn) do
    conn
    |> get_flash
    |> Enum.map(&flash_html/1)
  end

  defp flash_html({level, message}) do
    {:safe, "<div class='ui #{level} message'> <i class='close icon'></i> #{message} </div>"}
  end

  defp flash_html(_) do
    nil
  end
end
