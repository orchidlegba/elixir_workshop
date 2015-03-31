defmodule Main do 

	def main(_args) do 
		toggleResultOFF= SwitchBox.toggle %SwitchON{}
		toggleResultOn= SwitchBox.toggle %SwitchOFF{}
		IO.puts "toggleResultOFF -> #{inspect toggleResultOFF}"
		IO.puts "toggleResultOn -> #{inspect toggleResultOn}"

		eitherLeftOffAndRightOff_Result_Off = SwitchBox.either(%SwitchOFF{}, %SwitchOFF{})
		eitherLeftOnAndRightOff_Result_On = SwitchBox.either(%SwitchON{}, %SwitchOFF{})
		eitherLeftOffAndRightOn_Result_On = SwitchBox.either(%SwitchOFF{}, %SwitchON{})
		IO.puts "eitherLeftOffAndRightOff_Result_Off -> #{inspect eitherLeftOffAndRightOff_Result_Off}"
		IO.puts "eitherLeftOnAndRightOff_Result_On -> #{inspect eitherLeftOnAndRightOff_Result_On}"
		IO.puts "eitherLeftOffAndRightOn_Result_On -> #{inspect eitherLeftOffAndRightOn_Result_On}"

		allLeftOnAndRightOn_Result_On = SwitchBox.all(%SwitchON{}, %SwitchON{})
		allLeftOnAndRightOff_Result_Off = SwitchBox.all(%SwitchON{}, %SwitchOFF{})
		allLeftOffAndRightOn_Result_Off = SwitchBox.all(%SwitchOFF{}, %SwitchON{})
		IO.puts "allLeftOnAndRightOn_Result_On -> #{inspect allLeftOnAndRightOn_Result_On}"
		IO.puts "allLeftOnAndRightOff_Result_Off -> #{inspect allLeftOnAndRightOff_Result_Off}"
		IO.puts "allLeftOffAndRightOn_Result_Off -> #{inspect allLeftOffAndRightOn_Result_Off}"

		turtleMovement = DrawTurtle.spawn |> DrawTurtle.turn_right_then_two_steps_forward
		IO.puts "#{inspect turtleMovement, pretty: true}"

		treeSeed = BST.seed 4
		treeResult = BST.insert 2, treeSeed
		IO.puts "generate treeSeed -> #{inspect treeSeed, pretty: true}"
		IO.puts "create binary search tree #{inspect treeResult, pretty: true}"

	end
end