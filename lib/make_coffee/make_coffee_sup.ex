defmodule MakeCoffeeSup do
  import MakeCoffeeStateData
  use DynamicSupervisor
  def init(_init_arg) do

  opts = [strategy: :one_for_one, name: MakeCoffee.Supervisor]
  DynamicSupervisor.init(opts)
  end

  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  def start_worker() do
    children = [
      {MakeCoffee.Repo, []},
      {MakeCoffeeState, {:get_some_water, make_coffee_state_data()}}

  ]
  for child <- children, do: DynamicSupervisor.start_child(__MODULE__, child)
  end

end
