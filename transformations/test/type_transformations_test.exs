defmodule TypeTransformationsTest do
  use ExUnit.Case  

  def watchmenAuthor, do: %Author{firstName: "Alan", lastName: "Moore" }
  def watchmenIllustrator, do: %Author{firstName: "Dave", lastName: "Gibbons" }
  def watchmenComic, do: %Comic{title: "watchmenAuthor", 
  							authors: [watchmenAuthor],
  							illustrators: [watchmenIllustrator],
  							currency: %Money.Euro{price: 11.99}}

  test "change value price to 20 Euros on Comic" do
    %Comic{currency: %Money.Euro{price: price} } = TypeTransformations.change_price_to(watchmenComic, 20.0)   
    assert price == 20.0
  end

  test "change type currency From Euros to Dollars on Comic" do
    %Comic{currency: %Money.Dollar{price: price} } = TypeTransformations.change_currency_to(watchmenComic, %Money.Dollar{})
    assert Float.round(price, 4) == 12.9492
  end

   test "apply changes to price as 20.0 Euros and currency as Dollars" do 
  	changesToComic = %{ priceTo: 20.0, currencyTo: %Money.Dollar{} }

  	%Comic{currency: %Money.Dollar{price: price} } = TypeTransformations.apply_changes_to_comic(watchmenComic, changesToComic)
  	assert price == 21.6
  end
end