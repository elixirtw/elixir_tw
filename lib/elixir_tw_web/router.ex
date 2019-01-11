defmodule ElixirTwWeb.Router do
  use ElixirTwWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :guardian_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :guardian_authorization do
    # plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", ElixirTwWeb do
    pipe_through [:browser, :guardian_session]

    # get "/", PostController, :index
    get "/", PageController, :landing

    get "/login", SessionController, :new
    delete "/logout", SessionController, :delete

    resources "/posts", PostController, param: "slug", only: [:index, :show]
  end

  scope "/auth", ElixirTwWeb do
    pipe_through [:browser, :guardian_session]

    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :callback
    post "/:provider/callback", SessionController, :callback
  end

  scope "/user", ElixirTwWeb.User, as: :user do
    pipe_through [:browser, :guardian_session, :guardian_authorization]

    get "/", ConfigController, :dashboard
    resources "/posts", PostController, only: [:new, :create, :edit, :update]
  end
end
