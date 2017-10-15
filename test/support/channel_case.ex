defmodule ElixirTwWeb.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by
  channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also
  imports other functionality to make it easier
  to build and query schema.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use Phoenix.ChannelTest

      alias ElixirTw.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]

      # The default endpoint for testing
      @endpoint ElixirTwWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElixirTw.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElixirTw.Repo, {:shared, self()})
    end
  end
end
