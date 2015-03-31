defmodule SwitchON do 
	defstruct state: :on
end
defmodule SwitchOFF do 
	defstruct state: :off
end

# example FP  Sum type
defmodule SwitchBox do
	def toggle(%SwitchON{} = _switchState ), do: %SwitchOFF{}
	def toggle(%SwitchOFF{} = _switchState), do: %SwitchON{}
	
	def either( %SwitchOFF{} = _switchStateA, %SwitchOFF{} = _switchStateB ) do 
		%SwitchOFF{}
	end
	def either( %SwitchON{} = _switchStateA, _ ) do 
		%SwitchON{}
	end
	def either( _ , %SwitchON{} = _switchStateB ) do 
		%SwitchON{}
	end

	def all( %SwitchON{} = _switchStateA, %SwitchON{} = _switchStateB ) do 
		%SwitchON{}
	end
	def all( %SwitchOFF{} = _switchStateA, _ ) do 
		%SwitchOFF{}
	end
	def all( _ , %SwitchOFF{} = _switchStateB ) do 
		%SwitchOFF{}
	end
end