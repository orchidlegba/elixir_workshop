defmodule HigherOrder do 
	def filterByPredicate(list, predicate) when is_list(list) and is_function(predicate) do 
		Enum.filter(list, predicate)
	end

	def filterOnLargerThan5 do 
		filterByPredicate([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], fn element -> element > 5 end)
	end
end