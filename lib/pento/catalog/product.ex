defmodule Pento.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string
    field :sku, :integer
    field :unit_price, :float
    field :image_path, :string
    field :image_thumbnail_path, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :unit_price, :sku, :image_path])
    |> validate_required([:name, :description, :unit_price, :sku])
    |> unsafe_validate_unique(:name, Pento.Repo)
    |> unsafe_validate_unique(:sku, Pento.Repo)
    |> unique_constraint(:sku)
  end
end
