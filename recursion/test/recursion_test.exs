defmodule RecursionTest do
  use ExUnit.Case
  import Recursion

  test "find the last number" do
  	lastFoundNumber = find_last_item numbers
	assert lastFoundNumber == 60
  end

  test "list contains number" do 
  	numbersContains? = contains_number numbers, 60
	assert numbersContains? == true
  end
  test "reverse the order of numbers" do 
  	reversedNumbers = reverse numbersAlt
	assert reversedNumbers == [5, 4, 3, 2, 1]
  end
end
