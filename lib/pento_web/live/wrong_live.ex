defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, message: "make a guess", secret_number: :rand.uniform(10))}
  end

  # def handle_event("guess", %{"number" => guessed_number}, socket = %{assigns: %{score: score}}) do
  def handle_event("guess", %{"number" => guessed_number}, socket = %{assigns: %{score: score, secret_number: secret_number}}) do
    if String.to_integer(guessed_number) == secret_number do
      {
        :noreply,
        assign(
          socket,
          %{
            message: "your guess was right! The secret number was #{secret_number}. Restart the game!",
            score: 0
          }
        )
      }
    else
      {
        :noreply,
        assign(
          socket,
          %{
            message: "Your guess: #{guessed_number}. Wrong. Guess again. ",
            score: score - 1,
            secret_number: :rand.uniform(10)
          }
        )
      }
      
    end
    
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n}><%= n %></a>
      <% end %>
    </h2>
    """
  end
end