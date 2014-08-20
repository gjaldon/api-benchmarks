defmodule ElixirPhoenix.PingController do
  use Phoenix.Controller
  use Jazz

  def index(conn, _params) do
    {student} = :mongo.find_one(mongo_pid, "users", {:username, "student1"})
    username = %{username: elem(student, 7)}

    conn |> put_resp_content_type("application/json")
         |> render "index", student: username
  end

  def mongo_pid, do: Process.whereis(:mongo_conn)
end
