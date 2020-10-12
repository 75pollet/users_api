defmodule UsersApi.UserTest do
  use UsersApi.DataCase
  alias UsersApi.Users
  alias UsersApi.Users.User

  test "user can be successfully created" do
    {:ok, _user} = Users.create_user(%{points: 10})
  end

  test "user details can be updated successfully" do
    {:ok, user} = Users.create_user(%{points: 0})

    assert {:ok, %User{points: 20}} = Users.update_user(user, %{points: 20})
  end
end
