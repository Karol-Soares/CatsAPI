defmodule CatsApiTest do
  use CatsAPIWeb.ConnCase

  describe "POST create" do
    test "Success", %{conn: conn} do
      cats_params = %{name: "Mel", age: 2, castrate: true, vacinated: true}

      response_body = post(conn, Routes.catsapi_path(conn, :create), cats_params)

      assert response(response_body, 201)
    end

    test "Error", %{conn: conn} do
      cats_params = %{name: 1, age: 2, castrate: true, vacinated: true}

      response_body =
        conn
        |> post(Routes.catsapi_path(conn, :create), cats_params)
        |> json_response(:bad_request)

      expected_body = %{"message" => "invalid_data"}

      assert expected_body == response_body
    end
  end
end
