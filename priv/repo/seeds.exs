# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UsersApi.Repo.insert!(%UsersApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias UsersApi.Users
alias UsersApi.Repo

Repo.delete_all(Users.User)

Enum.each(1..100, fn _num ->
  Users.create_user(%{points: 0})
end)
