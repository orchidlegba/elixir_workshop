defmodule LocalActor.Client do 
	require Logger

	def filter_out_smaller(list) when is_list(list) do
		pid = spawn(LocalActor.Server, :filter_out_smaller, [])
		send pid, {:ok, list, self()}

		receive do 
			{:ok, resultMessage} ->
				Logger.info "#received resultMessage -> #{inspect resultMessage}"
				resultMessage
		end
	end

end

defmodule LocalActor.Server do 
	require Logger

	def filter_out_smaller do 
		receive do 
			{:ok, inputMessage, originPid} ->
				Logger.info "#received the inputMessage -> #{inspect inputMessage}"
				result = Transformations.filter_out_smaller(inputMessage)				
				result
				send originPid, {:ok, result}
				filter_out_smaller
		end
	end
end