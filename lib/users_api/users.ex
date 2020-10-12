defmodule UsersApi.Users do
  @moduledoc """
  This is the user context
  """

  alias UsersApi.Users.User
  alias UsersApi.Repo

  @doc """
  creates a user with the given attributes
  """
  @spec create_user(map()) :: {:ok, %User{}} | {:error, Ecto.Changeset.t()}
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  updates the given user with the given attributes
  """
  @spec update_user(%User{}, map()) :: {:ok, %User{}} | {:error, Ecto.Changeset.t()}
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
