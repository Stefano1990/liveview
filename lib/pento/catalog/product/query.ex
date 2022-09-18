defmodule Pento.Catalog.Product.Query do
  import Ecto.Query

  alias Pento.Catalog.Product
  alias Pento.Survey.Rating
  alias Pento.Accounts.User

  def base, do: Product

  def with_user_ratings(%User{} = user) do base()
    |> preload_user_ratings(user)
  end

  def preload_user_ratings(query, %User{} = user) do
    ratings_query = Rating.Query.preload_user(user)

    query
    |> preload(ratings_by_current_user: ^ratings_query)
  end
end
