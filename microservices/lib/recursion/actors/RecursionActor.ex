defmodule RecursionActor.Client do 
	require Logger

	def find_last_item(list) when is_list(list) do
		pid = spawn(RecursionActor.Server, :find_last_item, [])
		send pid, {:ok, list, self()}

		receive do 
			{:ok, resultMessage} ->
				Logger.info "#received resultMessage -> #{inspect resultMessage}"
				resultMessage
		end
	end

end

defmodule RecursionActor.Server do 
	require Logger

	def find_last_item do 
		receive do 
			{:ok, inputMessage, originPid} ->
				Logger.info "#received the inputMessage -> #{inspect inputMessage}"
				result = Recursion.find_last_item(inputMessage)				
				result
				send originPid, {:ok, result}
		end
	end
end