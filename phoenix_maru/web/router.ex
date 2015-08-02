defmodule PhoenixMaru.Router do
  use PhoenixMaru.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixMaru do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope path: "/api" do
    pipe_through :api

    forward "/", PhoenixMaru.API
  end
end