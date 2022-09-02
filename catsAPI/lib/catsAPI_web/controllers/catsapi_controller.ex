defmodule CatsAPIWeb.CatsapiController do
  # GET, POST, PUT, DELETE

  use CatsAPIWeb, :controller

  def list(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", cats: CatsAPI.Cat.get_all())
  end

  def show(conn, %{"id" => id}) do
    conn
    |> put_status(:ok)
    |> render("cat.json", cat: CatsAPI.Cat.get_by_id(id))
  end

  def create(conn, _params) do
    case CatsAPI.Cat.insert(conn.body_params) do
      {:ok, cat} ->
        conn
        |> IO.inspect(label: :CONN)
        |> put_status(:created)
        |> render("cat.json", cat: cat)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: "invalid_data"})
    end
  end

  # def update(conn, %{"id" => id}) do
  #   case CatsAPI.Cat.update(String.to_integer(id), conn.body_params) do
  #     {:ok, _user} ->
  #       resp(conn, :ok, "")

  #     {:error, :not_found} ->
  #       resp(conn, :not_found, "")
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   case MyApi.User.delete(id) do
  #     {:ok, _user} -> resp(conn, :ok, "")

  #     {:error, :not_found} ->
  #       resp(conn, :not_found, "")
  #   end
  # end
end
