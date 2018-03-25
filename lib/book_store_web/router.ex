defmodule BookStoreWeb.Router do
  use BookStoreWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", BookStoreWeb do
    pipe_through(:api)
  end

  forward("/graphql", Absinthe.Plug, schema: BookStoreWeb.Schema)

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: BookStoreWeb.Schema,
    interface: :playground
  )
end
