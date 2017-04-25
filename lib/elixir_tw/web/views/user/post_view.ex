defmodule ElixirTw.Web.User.PostView do
  use ElixirTw.Web, :view

  # Inline Script
  def render("script.html", _assigns) do
    ~E"""
      <script type="text/javascript" charset="utf-8">
        $('.ui.dropdown').dropdown()
        var simplemde = new SimpleMDE({ element: $("#post_body")[0] });
      </script>
    """
  end
end
