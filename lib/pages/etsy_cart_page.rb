class EtsyCartPage < BasePageClass

  expected_element :div, :id => 'checkout-header'
  expected_title 'Etsy - Shopping Cart'
  direct_url BASE_URL + 'cart'
  div :checkout_header, :id => 'checkout-header'
  link :remove, :text => 'Remove'
  link :first_item_name do |browser|
    browser.div(:class => 'item-details').link
  end
  div :zero_items_in_cart, :text => '0 items in your cart'

  def first_item_name_text
    first_item_name_link.text
  end

  def items_in_cart
    checkout_header_div.wait_until_present
    checkout_header.gsub(' items in your cart', '').to_i
  end

  def remove_item
    remove
    zero_items_in_cart_div.wait_until_present
  end

  def ensure_cart_empty
    100.times do
      remove if items_in_cart != 0
      break if items_in_cart == 0
    end
  end
end
