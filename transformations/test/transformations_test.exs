defmodule TransformationsTest do
  use ExUnit.Case
  import Transformations

  test "filter smaller than 5 and map multiply by 10" do
		result = numbers |> filter_out_smaller |> multiply_all 
		assert result == [10,20,30,40]    
  end


  test "comprehension filter smaller than 5 with even numbers multiplied by 10" do
  		result = numbers |> filter_out_smaller_with_multply_all 	
		assert result == [20,40]	 
  end
end
