defmodule ElixirTw.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_tw,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {ElixirTw, []},
     applications: [
       :phoenix,
       :phoenix_pubsub,
       :phoenix_html,
       :cowboy,
       :logger,
       :gettext,
       :phoenix_ecto,
       :ueberauth_facebook,
       :ueberauth_github,
       :postgrex,
       :edeliver
     ],
     included_applications: [
       :earmark,
       :gravity,
       :guardian,
       :guardian_db,
       :html_sanitize_ex,
       :pipe_to
     ]
   ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0-rc", override: true},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:guardian, "~> 0.14"},
     {:guardian_db, "~> 0.8"},
     {:ueberauth_facebook, "~> 0.6"},
     {:ueberauth_github, "~> 0.4"},
     {:distillery, "~> 1.1.0"},
     {:gravity, "~> 1.0"},
     {:earmark, "~> 1.1"},
     {:pipe_to, "~> 0.1"},
     {:html_sanitize_ex, "~> 1.1"},
     {:edeliver, "~> 1.4"},
     {:credo, "~> 0.6", only: [:dev, :test]}
   ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test":       ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
