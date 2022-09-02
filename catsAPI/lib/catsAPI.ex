defmodule CatsAPI.Cat do
  @moduledoc """
  CatsAPI keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  use Ecto.Schema

  import Ecto.Changeset

  schema "catsdb" do
    field :name, :string
    field :age, :integer
    field :castrate, :boolean
    field :vacinated, :boolean
  end

  def changeset(cat, params \\ %{}) do
    cat
    |> cast(params, [:name, :age, :castrate, :vacinated])
    |> validate_required([:name, :age, :castrate, :vacinated])
  end
end
