defmodule MangoWeb.Acceptance.HomepageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "presence of seasonal products" do
  
    navigate_to("/")

 
    
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Seasonal Products"

 
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |>  visible_text
    product_price = find_within_element(product, :css, ".product-price") |>  visible_text

    assert product_name == "Apple"

    
    assert product_price == "100"

    # And I expect that Tomato is not present on the screen.
    refute page_source() =~ "Tomato"
  end

end