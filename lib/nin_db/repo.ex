defmodule NinDB.Repo do
  use Ecto.Repo,
    otp_app: :nin_db,
    adapter: Ecto.Adapters.Postgres
end
