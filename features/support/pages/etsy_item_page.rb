class EtsyItemPage < EtsySuperPage

  expected_title /.+/
  button :add_to_cart, :value => "Add to Cart"
  div :item_title, :id => "item-title"

  def click_add_to_cart
    add_to_cart
    EtsyCartPage.new @browser, false
  end
end