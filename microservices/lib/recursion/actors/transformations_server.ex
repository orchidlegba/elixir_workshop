defmodule Transformations.Server do 
	use GenServer
	require Logger

	def start_link(opts \\ []) do
	   GenServer.start_link(__MODULE__, :ok, opts)
	end

	#async
	def handle_cast({ :filter, numbers }, _numbers_state) when is_list(numbers) do
		numbersFiltered = Transformations.filter_out_smaller numbers
		{:noreply, numbersFiltered} 
	end

	#sync
	def handle_call({ :numbers_state }, from, numbers_state) when is_list(numbers_state) do
		{:reply, {from, {:current_value, numbers_state}}, numbers_state} 
	end
end