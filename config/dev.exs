use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixir_tw, ElixirTwWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
             cd: Path.expand("../", __DIR__)]]

# Watch static and templates for browser reloading.
config :elixir_tw, ElixirTwWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/elixir_tw_web/views/.*(ex)$},
      ~r{lib/elixir_tw_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :elixir_tw, ElixirTw.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "elixir_tw_dev",
  hostname: "localhost",
  pool_size: 10

# Configure Guardian
config :guardian, Guardian,
  allowed_algos: ["ES512"],
  secret_key: %{"crv" => "P-521",
    "d" => "CF9e9LqOnbsaW0sY06opq1gVg-5wefE8SJN30kx1lMmaz6-edFuNA0obU1KaZTKQBpXSLgjtoqMJHiKjwiQbCG4",
    "kty" => "EC",
    "x" => "AWXnRMCaj96pL33ZhTw5mW8vjcvYPRLbWLfIO21Aig5qBs7ymegVGZWAThWfZcBa13sgBXTBm6rv7RvKKTx8qZGW",
    "y" => "AFWQhP0skj9iODTS4zn8vGcAAouvJ5HkLoBl72TNlh9WM6p0Cpc4Cf1XwRYkMzi-vVLpCEq27M22vZu__8FEV9io"}

config :mix_test_watch,
  clear: true,
  tasks: [
    # NOTE args passed in to mix test.watch is applied to all tasks,
    # so --stale switch would break credo task
    # hopefully this gets updated after
    "test --stale",
    "credo --strict"
  ]

import_config "dev.secret.exs"
