defmodule EssenceLinkWeb.Router do
  use EssenceLinkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # TODO : add jwt

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: EssenceLinkWeb.Schema,
      interface: :simple,
      context: %{pubsub: EssenceLinkWeb.Endpoint}
  end
end
