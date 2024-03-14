use Mix.Config
config :make_coffee,
ecto_repos: [MakeCoffee.Repo]
config :make_coffee, MakeCoffee.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "make_coffee_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost"
