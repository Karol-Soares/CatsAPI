defmodule CatsAPI.CatsApiTest do
  use ExUnit.Case

  alias CatsAPI.Cats.Cat

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(CatsAPI.Repo)
  end

  test "changeset is valid" do
    changeset =
      Cat.changeset(%Cat{}, %{
        name: "test",
        age: 24,
        castrate: true,
        vacinated: true
      })

    assert changeset.valid? == true
  end
end
