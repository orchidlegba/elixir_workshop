defmodule MicroservicesTest do
  use ExUnit.Case

  test "filter elements to smaller than 5  with a LocalActor MicroService" do
    resultAnswer = LocalActor.Client.filter_out_smaller([1,2,3,4,5,6,7,8,9,10])  	 
    assert resultAnswer == [1,2,3,4]
  end

  test "filter elements smaller to smaller than 5 with GenServer MicroService" do
  	{:ok, pid} = GenServer.start_link(Transformations.Server, [])
  	GenServer.cast(pid, {:filter, [1,2,3,4,5,6,7,8,9,10] })
    call_message = GenServer.call(pid, {:numbers_state})

  	IO.puts " Transformations.Server result -> #{inspect call_message}"
    { { _ , _ } , {:current_value, numbers_state} } = call_message
    assert numbers_state == [1,2,3,4]
  end	
end
