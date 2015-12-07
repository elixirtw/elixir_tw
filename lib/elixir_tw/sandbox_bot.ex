defmodule ElixirTW.SandboxBot do
  use Slack

  alias ElixirTW.Message

  def start_link(initial_state) do
    Slack.start_link(__MODULE__, FigaroElixir.env["slack_bot_token"], initial_state)
  end

  def init(initial_state, slack) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, initial_state}
  end

  def handle_message({:type, "hello", response}, slack, state) do
    {:ok, state}
  end

  def handle_message({:type, "message", response}, slack, state) do
    message = %Message{ member: response[:user], content: response[:text], file_type: response[:type]}

    if Repo.insert!(message) do
      IO.puts "message"
      IO.inspect response
    else
      IO.puts "message"
      IO.puts "Repo insert Failed"
    end

    {:ok, state}
  end

  def handle_message({:type, type, _response}, _slack, state) do
    IO.puts "Some other type"
    {:ok, state}
  end
end
