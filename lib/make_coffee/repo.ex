defmodule MakeCoffee.Repo do
  use Ecto.Repo,
    otp_app: :make_coffee,
    adapter: Ecto.Adapters.Postgres
end
