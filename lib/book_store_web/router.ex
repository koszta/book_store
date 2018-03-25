defmodule BookStoreWeb.Router do
  use BookStoreWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", BookStoreWeb do
    pipe_through(:api)
  end
end
