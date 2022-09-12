defmodule PentoWeb.UserAuthLive do
  import Phoenix.LiveView
  alias Pento.Accounts

  def on_mount(_, params, %{"user_token" => user_token}, socket) do
    Accounts.get_user_by_session_token(user_token)
    |> check_if_valid_user(socket)
  end

  defp check_if_valid_user(user = %Pento.Accounts.User{}, socket), do: {:cont, assign(socket, current_user: user)}
  defp check_if_valid_user(_, socket), do: {:halt, redirect(socket, to: "/login")}
end