defmodule MakeCoffeeApp do
   use GenStateMachine, callback_mode: [:handle_event_function, :state_enter]

   import MakeCoffeeStateData

   # Start the server
   def initialize() do
      state_data = make_coffee_state_data()
     GenStateMachine.start_link(MakeCoffeeApp, {:get_some_water, state_data})

   end

   # State functions

   def get_some_water(:enter, state, state_data) do
     IO.inspect(state, label: "state")
     Process.send(self(), :got_some_water, [])

     {:next_state, :get_some_water,
      MakeCoffeeStateData.make_coffee_state_data(state_data, water: :we_got_some_water)}
   end

   def get_some_water(:info, :got_some_water, state_data) do
     IO.inspect("got some water, let's wait for it to boil")

     {:next_state, :let_it_boil,
      MakeCoffeeStateData.make_coffee_state_data(state_data, water: :we_got_some_water, pid: self())}
   end

   def let_it_boil(:enter, _state, state_data) do
     IO.inspect("current_state: let_it_boil")
     IO.inspect(state_data, label: "state_data")

     {:next_state, :let_it_boil, state_data}
   end

   def let_it_boil(:cast, :water_boiled, state_data) do
     IO.inspect("water is boiled, waiting for coffee")

     updated_state_data =
       MakeCoffeeStateData.make_coffee_state_data(state_data,
         water: :boiled_water,
         coffee: :ready_to_add,
         coffee_cup: :ready_to_fill,
         coffee_machine: :ready_to_start
       )

     {:next_state, :wait_for_coffee, updated_state_data}
   end

   def wait_for_coffee(:enter, _state, state_data) do
     IO.inspect("current_state: wait_for_coffee")
     IO.inspect(state_data, label: "state_data")

     {:next_state, :wait_for_coffee, state_data}
   end

   def wait_for_coffee(:cast, :added_coffee, state_data) do
     IO.inspect("coffee is added, waiting for add ons")

     {:next_state, :wait_for_add_ons,
      MakeCoffeeStateData.make_coffee_state_data(state_data,
        coffee: :coffee_added,
        coffee_machine: :made_coffee,
        coffee_cup: :cup_is_filled
      )}
   end

   def wait_for_add_ons(:enter, _state, state_data) do
     IO.inspect("current_state: wait_for_add_ons")
     {:next_state, :wait_for_add_ons, state_data}
   end

   def wait_for_add_ons(:cast, :no_addons, state_data) do
     IO.inspect(state_data, label: "state_data")
     IO.inspect("Coffee is readyyyy")
     IO.inspect("going back to get some water")
     {:next_state, :get_some_water, make_coffee_state_data()}
   end

   # Callbacks

   def handle_event(:enter, event, state, state_data) do
     IO.inspect(event, label: "eventttt")
     IO.inspect(state, label: "stateee")
     {:next_state, state, state_data}
   end

   def handle_event(:cast, event, state, data) do
     IO.inspect(event, label: "unhandled event recieved ")
     IO.inspect(state, label: "in state ")
     {:keep_state, data}
   end

   def handle_event({:call, from}, _event, state, data) do
     {:next_state, state, data, [{:reply, from, data}]}
   end

   # # This is the client
   # GenStateMachine.cast(pid, :water_boiled)
   # #=> :ok

   # GenStateMachine.call(pid, :something)
   # => 1
 end
