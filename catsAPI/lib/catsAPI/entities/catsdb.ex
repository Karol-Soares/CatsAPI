defmodule CatsAPI.Entities.Catsdb do
 @moduledoc """
  The Cats context.
  """

  import Ecto.Query, warn: false
  alias CatsAPI.Repo

  alias CatsAPI.Cats.Cat

  def get_all(), do: Repo.all(Cat)

  def get_by_id(id), do: Repo.get(Cat, id)

  def insert(cat) do
    %Cat{}
    |> Cat.changeset(cat)
    |> Repo.insert()
  end

  def update(id, data) do
    case get_by_id(id) do
      nil ->
        {:error, :not_found}

      cat ->
        cat
        |> Cat.changeset(data)
        |> Repo.update()
    end
  end

  def delete(id) do
    case get_by_id(id) do
      nil ->
        {:error, :not_found}

      user ->
        Repo.delete(user)
    end
  end
end
