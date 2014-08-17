defmodule ElixirPhoenix.PingController do
  use Phoenix.Controller

  def index(conn, _params) do
    {:ok, connection} = :mongo.connect('127.0.0.1', 27017, "quipper_web_development")
    {student} = :mongo.find_one(connection, "users", {:username, "student1"})
    username = [username: elem(student, 7)]

    conn |> assign_layout(:none)
         |> render "index", student: username
  end
end
