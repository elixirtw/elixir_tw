defmodule ElixirTw.PageControllerTest do
  use ElixirTw.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Elixir 台灣"
  end
end
