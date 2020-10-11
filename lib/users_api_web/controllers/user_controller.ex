defmodule UsersApiWeb.UserController do
  use UsersApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", state: GenServer.call(UsersApi.Server, :get_users))
  end
end
