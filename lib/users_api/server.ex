defmodule UsersApi.Server do
  use GenServer
  alias UsersApi.Users
  alias UsersApi.Users.User
  alias UsersApi.Repo

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{max_number: Enum.random(1..100), timestamp: nil},
      name: __MODULE__
    )
  end

  @impl true
  def init(state) do
    _schedule_next_run()
    {:ok, state}
  end

  @impl true
  def handle_info(:update_points, state) do
    _schedule_next_run()

    User.all_users_query()
    |> Repo.all()
    |> Enum.each(fn user ->
      Users.update_user(user, %{points: Enum.random(1..100)})
    end)

    {:noreply, %{state | max_number: Enum.random(1..100)}}
  end

  @impl true
  def handle_call(:get_users, _from, state) do
    new_state = %{state | timestamp: NaiveDateTime.utc_now()}
    {:reply, %{users: _users(state.max_number), timestamp: new_state.timestamp}, new_state}
  end

  defp _schedule_next_run do
    Process.send_after(self(), :update_points, 60_000)
  end

  defp _users(max_number) do
    max_number |> User.users_with_most_points() |> Repo.all()
  end
end
