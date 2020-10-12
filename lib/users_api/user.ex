defmodule UsersApi.Users.User do
  @moduledoc """
  This is the user schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :points, :integer

    timestamps()
  end

  def changeset(user, attributes \\ %{}) do
    user
    |> cast(attributes, [:points])
  end

  @doc """
  returns a query that fetches all users
  """
  @spec all_users_query :: Ecto.Query.t()
  def all_users_query do
    from(__MODULE__)
  end

  @doc """
  returns a query that fetches two users whose points are more than
  max number
  """
  @spec users_with_most_points(integer()) :: Ecto.Query.t()
  def users_with_most_points(max_number) do
    from u in all_users_query(),
      where: u.points > ^max_number,
      order_by: [desc: u.points],
      limit: 2,
      select: %{id: u.id, points: u.points}
  end
end
