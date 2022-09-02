defmodule CatsAPI.Repo.Migrations.CreateCatsdbTable do
  use Ecto.Migration

  def change do
    create table("catsdb") do
      add :name, :string
      add :age, :integer
      add :castrate, :boolean
      add :vacinated, :boolean
    end
  end
end
