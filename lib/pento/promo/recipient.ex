defmodule Pento.Promo.Recipient do
  defstruct [:first_name, :email]
  @types %{first_name: :string, email: :string}

  import Ecto.Changeset

  def changeset(%__MODULE__{} = recipient, attrs \\ %{}) do
    # recipient
    {recipient, @types}
    |> cast(attrs, [:first_name, :email])
    |> validate_required([:first_name, :email])
    |> validate_format(:email, ~r/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)
  end 
end