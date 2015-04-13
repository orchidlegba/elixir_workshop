defmodule MicroservicesTest do
  use ExUnit.Case

  test "find the last item in list with an Actor Microservice" do
  	resultAnswer = RecursionActor.Client.find_last_item([1,2,3,4,5])  	 
    assert resultAnswer == 5
  end
end
