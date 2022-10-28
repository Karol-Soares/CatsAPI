defmodule CatsAPIWeb.CatsapiView do
  use CatsAPIWeb, :view

  alias CatsAPI.Cats.Cat

  def render("index.json", %{cats: cats}) do
    %{data: render_many(cats, __MODULE__, "cat.json")}
  end

  def render("cat.json", %{cat: cat}) do
    %{
      id: cat.id,
      name: cat.name,
      age: cat.age,
      castrate: cat.castrate,
      vacinated: cat.vacinated
    }
  end
end
