defmodule PentoWeb.PromoLive do
  use PentoWeb, :live_view

  alias Pento.Promo
  alias Pento.Promo.Recipient

  def mount(_params, _session, socket) do
    socket = 
      socket
      |> assign_recipient()
      |> assign_changeset()
    
    {:ok, socket}
  end

  defp assign_recipient(socket) do
    assign(socket, :recipient, %Recipient{})
  end

  defp assign_changeset(%{assigns: %{recipient: recipient}} = socket) do
    assign(socket, :changeset, Promo.change_recipient(recipient, %{}))
  end

  def handle_event("validate", %{"recipient" => recipient_params}, %{assigns: %{recipient: recipient}} = socket) do
    changeset =
      recipient
      |> Promo.change_recipient(recipient_params)
      |> Map.put(:action, :validate)

    {
      :noreply,
      socket
      |> assign(changeset: changeset)
      |> put_flash(:info, "soasdfasdf")
    }
  end
end