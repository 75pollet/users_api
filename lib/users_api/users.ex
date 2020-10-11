defmodule UsersApi.Users do
  @moduledoc """
  This is the user context
  """

  alias UsersApi.Users.User
  alias UsersApi.Repo

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
