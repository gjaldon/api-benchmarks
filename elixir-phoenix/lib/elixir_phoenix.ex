defmodule ElixirPhoenix do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    :ok = :application.start(:bson)
    :ok = :application.start(:mongodb)
    {:ok, pid} = :mongo.connect('127.0.0.1', 27017, "quipper_web_development")
    Process.register(pid, :mongo_conn)

    ElixirPhoenix.Supervisor.start_link
  end
end
