defmodule CatsAPI.Entities.Catsdb do
  alias CatsAPI.Repo
  alias CatsAPI.Cat

  def get_all(), do: Repo.all(CatsAPI.Cat)

  def get_by_id(id), do: Repo.get(CatsAPI.Cat, id)

  def insert(cat) do
    %CatsAPI.Cat{}
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
