defmodule MakeCoffeeStateData do
  import Record

  defrecord :make_coffee_state_data,
    coffee_machine: nil,
    coffee: nil,
    coffee_cup: nil,
    water: nil,
    milk: nil,
    sugar: nil,
    pid: nil

  # @type make_coffee_state_data :: record(:make_coffee_state_data, %{coffee_machine: pid, coffee: integer, water: integer, milk: integer, sugar: integer})
end
