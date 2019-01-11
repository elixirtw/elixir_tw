# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_tw, ElixirTwWeb.Endpoint,
  url: [host: "localhost"],
  # root: Path.dirname(__DIR__),
  secret_key_base: "C9+8f85LKUz7MBf92Ot1F6Y94Q4PcCS88hllNo7JCUB1dYsiMD0MRs1qpGNI5p7L",
  render_errors: [view: ElixirTwWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirTw.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  # optional
  allowed_algos: ["HS512"],
  hooks: GuardianDb,
  issuer: "ElixirTW",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: ElixirTw.Account.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Ecto 2.0 config
config :elixir_tw, ecto_repos: [ElixirTw.Repo]

config :guardian_db, GuardianDb,
  repo: ElixirTw.Repo,
  # min
  sweep_interval: 120

# Uberauth's Oauth Settings
config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, [profile_fields: "email,name"]},
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]
