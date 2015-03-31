defmodule Main do 
	import Recursion

	def main(_args) do 
		lastFoundNumber = find_last_item numbers
		IO.puts "lastFoundNumber #{inspect lastFoundNumber}"

		numbersContains? = contains_number numbers, 60
		IO.puts "numbersContains? #{inspect numbersContains?}"
		
		reversedNumbers = reverse numbersAlt
		IO.puts "reversedNumbers #{inspect reversedNumbers}"
	end
end