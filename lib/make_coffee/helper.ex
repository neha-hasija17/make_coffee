defmodule Helper do

  def got_some_water do
    GenStateMachine.cast(MakeCoffeeState, :got_some_water)
  end
  def water_boiled do
    GenStateMachine.cast(MakeCoffeeState, :water_boiled)
  end
  def added_coffee do
    GenStateMachine.cast(MakeCoffeeState, :added_coffee)
  end
  def no_add_ons do
    GenStateMachine.cast(MakeCoffeeState, :no_addons)
  end
end
