defmodule NinDB.Repo do
  use Ecto.Repo,
    otp_app: :nindb,
    adapter: Ecto.Adapters.Postgres
end
