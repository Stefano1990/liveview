defmodule Pento.Survey.Demographic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "demographics" do
    field :year_of_birth, :integer
    field :gender, :string
    belongs_to :user, Pento.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(demographic, attrs) do
    demographic
    |> cast(attrs, [:gender, :year_of_birth])
    |> validate_required([:gender, :year_of_birth, :user_id])
    |> validate_inclusion(:year_of_birth, 1900..2022)
    |> validate_inclusion(:gender, ["male", "female", "other", "prefer not to say"])
    |> unique_constraint(:user_id)
  end
end
