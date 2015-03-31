defprotocol SwitchBoxDispatch do 
	def toggle(switchState)
end

defimpl SwitchBoxDispatch, for: SwitchON do 
	def toggle(_switchState), do: %SwitchOFF{}
end

defimpl SwitchBoxDispatch, for: SwitchOFF do 
	def toggle(_switchState), do: %SwitchON{}
end

