defmodule Tree do 
	defstruct value: 0, left: %{}, right: %{}
end

defmodule Leaf do 
	defstruct value: 0, left: :leaf, right: :leaf
end

defmodule BST do 
	def seed(value) when is_integer(value) do
		%Tree{value: value, left: %Leaf{}, right: %Leaf{}} 
	end

	def insert( value, %Tree{} = tree) when is_integer(value) do
		case {value, tree} do 
			{ value, %Tree{ value: innerValue, left: innerLeft, right: innerRight} } when value == innerValue -> 
				%Tree{value: innerValue, left: innerLeft, right: innerRight}
			{ value, %Tree{ value: innerValue, left: innerLeft, right: innerRight} } when value < innerValue -> 
				%Tree{value: innerValue, left: insert(value, innerLeft), right: innerRight}
			{ value, %Tree{ value: innerValue, left: innerLeft, right: innerRight} } when value > innerValue ->  
				%Tree{value: innerValue, left: innerLeft, right: insert(value, innerRight)}
		end
	end

	def insert( value, %Leaf{} = tree) when is_integer(value) do
		case {value, tree} do 
			{ value, %Leaf{} } -> 
				seed(value)
		end
	end
end