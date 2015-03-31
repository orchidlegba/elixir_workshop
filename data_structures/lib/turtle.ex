defmodule Position do 
	@derive [Access]
	defstruct xPosition: 0, yPosition: 0
end

defmodule Heading do 
	@derive [Access]
	defstruct heading: 0
end

defmodule PenUp do 
	@derive [Access]
	defstruct state: :up
end

defmodule PenDown do 
	@derive [Access]
	defstruct state: :down
end

defmodule Turtle do 
	@derive [Access]
	defstruct position: %Position{}, heading: %Heading{}, penState: %PenUp{}
end

# Example Lensing
defmodule GraphicsTurtle do 
	def put_pen_down(%Turtle{} = turtle) do 
		update_in(turtle, [ :penState ],  fn _ -> %PenDown{} end )
	end
	def pick_pen_up(%Turtle{} = turtle) do 
		update_in(turtle, [ :penState ],  fn _ -> %PenUp{} end )
	end
	
	def turn_right(%Turtle{ heading: %Heading{ heading: heading} } = turtle) when heading <= 360 do 		
		update_in(turtle, [ :heading, :heading ],  fn headingValue -> headingValue + 90 end )
	end
	def turn_left(%Turtle{ heading: %Heading{ heading: heading} } = turtle) when heading >= 0 do 
		update_in(turtle, [ :heading, :heading ],  fn headingValue -> headingValue - 90 end )
	end
	def step_forward(%Turtle{ heading: %Heading{ heading: heading}} = turtle) when heading == 0 do 
		update_in(turtle, [ :position, :yPosition ],  fn yPosition -> yPosition + 1 end )
	end
	def step_forward(%Turtle{ heading: %Heading{ heading: heading}} = turtle) when heading == 180 do 
		update_in(turtle, [ :position, :yPosition ],  fn yPosition -> yPosition - 1 end )
	end
	def step_forward(%Turtle{ heading: %Heading{ heading: heading}} = turtle) when heading == 90 do 
		update_in(turtle, [ :position, :xPosition ],  fn xPosition -> xPosition + 1 end )
	end
	def step_forward(%Turtle{ heading: %Heading{ heading: heading}} = turtle) when heading == 270 do 
		update_in(turtle, [ :position, :xPosition ],  fn xPosition -> xPosition - 1 end )
	end
end

defmodule DrawTurtle do 
	import GraphicsTurtle	
	def spawn do 
		%Turtle{position: %Position{xPosition: 10, yPosition: 15}, heading: %Heading{}, penState: %PenUp{} }
	end
	def turn_right_then_two_steps_forward(%Turtle{} = turtle) do			
		turtle |> put_pen_down |> turn_right |> step_forward |> step_forward
	end
end
