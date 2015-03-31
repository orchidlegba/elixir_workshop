defmodule Author do  
  defstruct name: nil
end
defmodule Book do 
  defstruct title: nil, authors: [], price: nil
end
defmodule ProcessShoppingCart do
	def addToCart( [ %Book{} | _ ] = shoppingList, %Book{} = book) do 
		[book | shoppingList]
	end

	def total( [ %Book{} | _ ] = shoppingList) do 
		bookPrices = Enum.map(shoppingList, fn book -> book.price end)
		Enum.sum(bookPrices)
	end	
end