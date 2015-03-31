defmodule Main do 
	import Transformations

	def main(_args) do 
		result1 = numbers |> filter_out_smaller |> multiply_all 
		IO.puts "answer with filter + map -> #{inspect result1}"		

		result2 = numbers |> filter_out_smaller_with_multply_all 
		IO.puts "answer with for comprehension -> #{inspect result2}"		
	end	
end