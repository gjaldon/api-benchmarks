defmodule ElixirPhoenix.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :elixir_phoenix

  scope alias: ElixirPhoenix do
    get "/",      PageController, :index, as: :page
    get "/ping",  PingController, :index
  end
end
