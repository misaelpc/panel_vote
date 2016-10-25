defmodule PanelVote.Router do
  use PanelVote.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PanelVote do
    pipe_through :browser # Use the default browser stack

    get "/", LoginController, :index
  end

  #Other scopes may use custom stacks.
  scope "/api/v1", PanelVote do
    pipe_through :api
    post "/user/", LoginController, :create_user
  end
end
