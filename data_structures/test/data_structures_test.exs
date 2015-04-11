defmodule DataStructuresTest do
  use ExUnit.Case

  test "SwitchON results in SwitchOFF" do  
  	toggleResultOFF= SwitchBox.toggle %SwitchON{}
  	assert toggleResultOFF ==  %SwitchOFF{}
  end
  test "SwitchOFF results in SwitchON" do  
  	toggleResultOn = SwitchBox.toggle %SwitchOFF{}
  	assert toggleResultOn ==  %SwitchON{}
  end
  test "either LeftOff and RightOff result in SwitchOFF" do  
  	eitherLeftOffAndRightOff_Result_Off = SwitchBox.either(%SwitchOFF{}, %SwitchOFF{})
  	assert eitherLeftOffAndRightOff_Result_Off == %SwitchOFF{}
  end
  test "either LeftOn and RightOff results in SwitchON" do  
  	eitherLeftOnAndRightOff_Result_On = SwitchBox.either(%SwitchON{}, %SwitchOFF{})
  	assert eitherLeftOnAndRightOff_Result_On == %SwitchON{}
  end
  test "either LeftOff and RightOn results in SwitchON" do  
  	eitherLeftOffAndRightOn_Result_On = SwitchBox.either(%SwitchOFF{}, %SwitchON{})
  	assert eitherLeftOffAndRightOn_Result_On == %SwitchON{}
  end
  test "all LeftOn and RightOn results in SwitchON" do  
  	allLeftOnAndRightOn_Result_On = SwitchBox.all(%SwitchON{}, %SwitchON{})
  	assert allLeftOnAndRightOn_Result_On == %SwitchON{}
  end
  test "all LeftOn and RightOff results in SwitchOFF" do  
  	allLeftOnAndRightOff_Result_Off = SwitchBox.all(%SwitchON{}, %SwitchOFF{})
  	assert allLeftOnAndRightOff_Result_Off == %SwitchOFF{}
  end
  test "all LeftOff And RightOn results in SwitchOFF" do  
  	allLeftOffAndRightOn_Result_Off = SwitchBox.all(%SwitchOFF{}, %SwitchON{})
  	assert allLeftOffAndRightOn_Result_Off == %SwitchOFF{}
  end
  test "turtle turns right then takes two steps forward" do  
  	turtleMovement = DrawTurtle.spawn |> DrawTurtle.turn_right_then_two_steps_forward
	assert turtleMovement == %Turtle{heading: %Heading{heading: 90},
							 penState: %PenDown{state: :down},
 							 position: %Position{xPosition: 12, yPosition: 15}}
  end
  test "binary seatch tree with tree seed value 4 and inserting tree value 2" do  
  	treeSeed = BST.seed 4
	treeResult = BST.insert 2, treeSeed
	assert treeResult ==  %Tree{left: %Tree{left: %Leaf{left: :leaf, right: :leaf, value: 0},
   						  					right: %Leaf{left: :leaf, right: :leaf, value: 0}, value: 2},
  						 		right: %Leaf{left: :leaf, right: :leaf, value: 0}, value: 4} 
  end
end
