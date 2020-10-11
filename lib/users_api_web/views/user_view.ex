defmodule UsersApiWeb.UserView do
  use UsersApiWeb, :view

  def render("index.json", %{state: state}) do
    %{
      state
      | timestamp: state.timestamp |> NaiveDateTime.truncate(:second) |> NaiveDateTime.to_string()
    }
  end
end
