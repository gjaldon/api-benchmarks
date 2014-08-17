defmodule ElixirPhoenix.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :elixir_phoenix
  get "/", ElixirPhoenix.PageController, :index, as: :page
end
