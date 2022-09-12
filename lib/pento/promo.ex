defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(%Recipient{} = recipient) do
    {:ok, recipient}
  end
end