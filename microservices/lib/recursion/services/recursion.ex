defmodule Recursion do
	require List

	def numbers, do: [20, 40, 60]
	def numbersAlt, do: [1, 2, 3, 4, 5]

	defp find_last_item(list, lastNumberAcc) when is_integer(lastNumberAcc) and is_list(list)  do
		if length(list) == 0 do
			lastNumberAcc
		else

			find_last_item( tl(list), hd(list) )
		end
	end

	def find_last_item(list) when is_list(list) do 
		find_last_item(list, 0)
	end

	defp contains_number(list, searchItem, currentItemAcc) when is_list(list) and is_integer(searchItem) do
		cond do
			currentItemAcc == searchItem ->
				true
			[] == list ->
				false	
			length(list) > 0 -> 
				contains_number(tl(list), searchItem,  hd(list) )
		end
	end

	def contains_number(list, searchItem) when is_list(list) and is_integer(searchItem)  do
		contains_number(list, searchItem, 0)
	end

	def reverse(list) when is_list(list) do 
		reverse([], list)
	end

	defp reverse(listAcc, []) when is_list(listAcc) do 
		listAcc
	end

	defp reverse(listAcc, list) when is_list(listAcc) and is_list(list) do
		prependedItems = [ hd(list) | listAcc]
		reverse(prependedItems, tl(list))
	end

end
