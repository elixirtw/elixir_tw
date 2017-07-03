defmodule ElixirTw.Web.PageControllerTest do
  use ElixirTw.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Elixir |> Taiwan"
  end
end
