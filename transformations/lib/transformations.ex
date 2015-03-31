defmodule Transformations do
	require Integer
	def numbers, do: [1,2,3,4,5,6,7,8,9,10]

	def filter_out_smaller(list) when is_list(list) do 
		Enum.filter( list, fn element -> element < 5 end )
	end

	def multiply_all(list) when is_list(list) do 
		Enum.map(list, fn element -> element * 10 end)
	end

	def filter_out_smaller_with_multply_all(list) when is_list(list) do 
		for element <- list,  element < 5 , Integer.is_even(element), do: element * 10
	end	
end
