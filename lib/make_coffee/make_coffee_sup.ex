defmodule MakeCoffeeSup do
  import MakeCoffeeStateData
  use Supervisor
  def init(_init_arg) do
    children = [
      {MakeCoffee.Repo, []},
      {MakeCoffeeState, {:get_some_water, make_coffee_state_data()}}

  ]
  opts = [strategy: :one_for_one, name: MakeCoffee.Supervisor]
  Supervisor.init(children, opts)
  end

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

end
