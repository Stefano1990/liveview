defmodule Pento.Repo.Migrations.AddImagePathToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :image_path, :string
      add :image_thumbnail_path, :string
    end
  end
end
