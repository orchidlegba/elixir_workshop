defmodule IterationSumWithStandardLib do	
	def sum(numbers) when is_list(numbers) do 
		Enum.sum(numbers)
	end
end

defmodule IterationSumCustom do 
	defp sum([], sumAccumalator) when is_integer(sumAccumalator) do 
		sumAccumalator
	end

	defp sum([head | tail], sumAccumalator) when is_integer(sumAccumalator) do
		sum(tail, head + sumAccumalator) 
	end

	def sum(numbers) when is_list(numbers) do 
		sum(numbers, 0)
	end
end