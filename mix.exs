defmodule MakeCoffee.MixProject do
  use Mix.Project

  def project do
    [
      app: :make_coffee,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MakeCoffee, []},
      extra_applications:
      [:gen_state_machine]

    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:gen_state_machine, "~> 3.0.0"},
      {:ecto, "~> 2.0"},
   {:postgrex, "~> 0.11"},
      {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
