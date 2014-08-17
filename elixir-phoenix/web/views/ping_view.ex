defmodule ElixirPhoenix.PingView do
  use ElixirPhoenix.Views

  def render("index.json", attributes) do
    JSON.encode!(attributes[:student])
  end

end
