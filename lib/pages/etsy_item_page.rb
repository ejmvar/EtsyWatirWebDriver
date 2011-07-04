class EtsyItemPage < BasePageClass

  expected_title /.+/
  button :add_to_cart, :value => "Add to Cart"
  div :item_title, :id => "item-title"

  def click_add_to_cart
    add_to_cart
  end
end