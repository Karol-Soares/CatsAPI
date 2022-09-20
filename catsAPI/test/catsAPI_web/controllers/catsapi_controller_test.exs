defmodule CatsApiTest do
  use CatsAPIWeb.ConnCase

  describe "POST create" do
    test "Success", %{conn: conn} do
      cats_params = %{name: "Mel", age: 2, castrate: true, vacinated: true}

      conn = post(conn, Routes.catsapi_path(conn, :create), cats_params)

      assert response(conn, 201)
    end
  end
end
