defmodule ElixirTW.SandboxBot do
  use Slack

  def start_link(initial_state) do
    Slack.start_link(__MODULE__, System.get_env("SLACK_BOT_TOKEN"), initial_state)
  end

  def init(initial_state, slack) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, initial_state}
  end

  def handle_message({:type, "hello", response}, slack, state) do
    {:ok, state}
  end

  def handle_message({:type, "message", response}, slack, state) do
    IO.puts "message"
    IO.inspect response

    {:ok, state}
  end

  def handle_message({:type, type, _response}, _slack, state) do
    IO.puts "Some other type"
    {:ok, state}
  end
end
