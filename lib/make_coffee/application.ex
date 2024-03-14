defmodule MakeCoffee.Application do

  use Application

  @impl Application
  def start(_type, _args) do
    children =
      [
        MakeCoffeeSup
      ]
    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
