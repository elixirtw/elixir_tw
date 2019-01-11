defmodule ElixirTwWeb.PageControllerTest do
  use ElixirTwWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Elixir |> Taiwan"
  end
end
