defmodule MangoWeb.Acceptance.CategoryPageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  setup do
   
    :ok
  end
  
  test "shows fruits" do
    
    navigate_to("/categories/fruits")

    ## THEN ##
    # I expect the page title to be "Fruits"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Fruits"

    # And I expect Tomato in the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    # And I expect its price to be displayed on screen
    assert product_price == "100"

    # And I expect that Tomato is not present on screen.
    refute page_source() =~ "Tomato"
  end

  test "shows vegetables" do
   
    navigate_to("/categories/vegetables")

  
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Vegetables"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Tomato"
   
    assert product_price == "50"

    refute page_source() =~ "Apple"
  end

end