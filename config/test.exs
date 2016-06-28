use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_tw, ElixirTw.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_tw, ElixirTw.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "elixir_tw_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "ElixirTW",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: %{"crv" => "P-521",
    "d" => "CF9e9LqOnbsaW0sY06opq1gVg-5wefE8SJN30kx1lMmaz6-edFuNA0obU1KaZTKQBpXSLgjtoqMJHiKjwiQbCG4",
    "kty" => "EC",
    "x" => "AWXnRMCaj96pL33ZhTw5mW8vjcvYPRLbWLfIO21Aig5qBs7ymegVGZWAThWfZcBa13sgBXTBm6rv7RvKKTx8qZGW",
    "y" => "AFWQhP0skj9iODTS4zn8vGcAAouvJ5HkLoBl72TNlh9WM6p0Cpc4Cf1XwRYkMzi-vVLpCEq27M22vZu__8FEV9io"},
  serializer: ElixirTw.GuardianSerializer
