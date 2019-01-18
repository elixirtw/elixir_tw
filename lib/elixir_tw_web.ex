defmodule ElixirTwWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use ElixirTwWeb, :controller
      use ElixirTwWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def schema do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]

      ElixirTwWeb.aliases()
    end
  end

  def context do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Query
      import Ecto.Changeset

      alias ElixirTw.Repo

      ElixirTwWeb.aliases()
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: ElixirTwWeb
      require Logger

      alias ElixirTw.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]

      alias ElixirTwWeb.Router.Helpers, as: Routes
      import ElixirTwWeb.Gettext

      import ElixirTw.Auth.Guardian.Plug, only: [current_resource: 1]

      ElixirTwWeb.aliases()
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/elixir_tw_web/templates", namespace: ElixirTwWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      alias ElixirTwWeb.Router.Helpers, as: Routes
      import ElixirTwWeb.ErrorHelpers
      import ElixirTwWeb.Gettext
      import ElixirTw.Auth.Guardian.Plug, only: [current_resource: 1]

      ElixirTwWeb.aliases()
    end
  end

  def router do
    quote do
      use Phoenix.Router

      ElixirTwWeb.aliases()
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias ElixirTw.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]
      import ElixirTwWeb.Gettext

      ElixirTwWeb.aliases()
    end
  end

  @doc """
  When used, dispatch to the appropriate controllen/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  defmacro aliases do
    quote do
      alias ElixirTw.Auth
    end
  end
end
