defmodule MakeCoffee do
  use Application
     def start(_type, _args) do
     children = [
         {MakeCoffee.Repo, []}

     ]
     opts = [strategy: :one_for_one, name: MakeCoffee.Supervisor]
     Supervisor.start_link(children, opts)
     MakeCoffeeApp.initialize()
  end
end
