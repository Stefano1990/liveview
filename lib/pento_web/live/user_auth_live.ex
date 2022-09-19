defmodule PentoWeb.UserAuthLive do
  import Phoenix.LiveView
  alias Pento.Accounts
  alias Pento.Accounts.User

  def on_mount(_, _params, %{"user_token" => user_token}, socket) do
    socket
    |> assign_new(:current_user, fn ->
      Accounts.get_user_by_session_token(user_token)
    end)
    |> check_if_valid_user()
  end

  defp check_if_valid_user(socket = %{assigns: %{current_user: %User{}}}) do
    {:cont, socket}
  end
  defp check_if_valid_user(socket) do
    {:halt, redirect(socket, to: "/login")}
  end
end
