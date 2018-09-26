defmodule ElixirTw.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_tw,
     version: "0.0.2",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     #build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     dialyzer: [plt_add_deps: :transitive],
     deploy_dir: "/opt/elixirtw/elixir_tw/",
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {ElixirTw, []},
     extra_applications: [:logger, :runtime_tools]
   ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0"},
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
     {:distillery, "~> 1.5.0", runtime: false},
     {:gravity, "~> 1.0"},
     {:earmark, "~> 1.1"},
     {:pipe_to, "~> 0.1"},
     {:html_sanitize_ex, "~> 1.1"},
     {:conform, "~> 2.2"},
     {:ex_machina, "~> 2.0", only: [:dev, :test]},
     {:faker, "~> 0.9", only: [:dev, :test]},
     {:dialyxir, "~> 0.5.0", only: [:dev, :test], runtime: false},
     {:mix_test_watch, "~> 0.3", only: :dev, runtime: false}
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
