defmodule CatsAPI.Repo do
  use Ecto.Repo,
    otp_app: :catsAPI,
    adapter: Ecto.Adapters.Postgres
end
