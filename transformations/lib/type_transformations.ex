defmodule Author do  
  defstruct firstName: nil, lastName: nil
end
defmodule Illustrator do  
  defstruct firstName: nil, lastName: nil
end
# use protocols for money types
defmodule Money.Dollar do 
	@derive [Access]
	defstruct price: nil
end
defmodule Money.Euro do 
	@derive [Access]
	defstruct price: nil
end
defprotocol Money do 
	@doc """
	convert Money between currencies
	"""
	def toCurrency(fromCurrency, toCurrency)
end
defimpl Money, for: Money.Dollar do
	def toCurrency(%Money.Dollar{price: priceFrom}, %Money.Euro{price: nil} = targetCurrency) when not is_nil(priceFrom) do 
		%{targetCurrency | price: priceFrom * 0.93}  
	end
end
defimpl Money, for: Money.Euro do
	def toCurrency(%Money.Euro{price: priceFrom}, %Money.Dollar{price: nil} = targetCurrency) when not is_nil(priceFrom) do 
		%{targetCurrency | price: priceFrom * 1.08 }  
	end  
end

defmodule Comic do 
	@derive [Access]
	defstruct title: nil, authors: [], illustrators: [] , currency: nil
end

defmodule TypeTransformations do 
	  #functor -> change value price
	  def change_price_to(%Comic{currency: %{price: priceFrom }} = comic, targetPrice) 
	  when is_float(targetPrice) and is_float(priceFrom) do 	  	 
	  	 update_in(comic, [:currency, :price], fn _ -> targetPrice end )
	  end

	  #monad -> change type currency
	   def change_currency_to(%Comic{currency: fromCurrency} = comic, %{} = toCurrency) do 
	  	currencyResult = Money.toCurrency(fromCurrency, toCurrency)
	  	%{comic | currency: currencyResult }
	  end

	  #applicative -> apply changes to price and currency through curried functions in a call chain
	  def apply_changes_to_comic(%Comic{} = comic, %{priceTo: priceTo, currencyTo: currencTo} = applicativeChanges) do 
	    priceChangeCurriedFunction = &(TypeTransformations.change_price_to(&1, priceTo))
  		currencyChangeCurriedFunction = &(TypeTransformations.change_currency_to(&1, currencTo))
  		comicTransformationsResult = comic |> priceChangeCurriedFunction.() |> currencyChangeCurriedFunction.()
  		comicTransformationsResult
	  end	
end