class EtsyCartPage < EtsySuperPage

  expected_title "Etsy - Shopping Cart"
  direct_url_suffix "cart"
  div :checkout_header, :id => "checkout-header"
  link :remove, :text => "Remove"
  link :first_item_name do |browser|
    browser.div(:class => "item-details").link
  end

  def first_item_name_text
    first_item_name_link.text
  end

  def items_in_cart
    checkout_header_div.wait_until_present
    checkout_header
  end

  def remove_item
    remove
    remove_link.wait_while_present
  end

  def ensure_cart_empty
    100.times do
      remove if items_in_cart != "0 items in your cart"
      break if items_in_cart == "0 items in your cart"
    end
  end
end
