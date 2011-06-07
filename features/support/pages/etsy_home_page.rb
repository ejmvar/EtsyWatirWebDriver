class EtsyHomePage < BasePageClass

  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  direct_url BASE_URL
  link :buy, :text => "Buy"

  def click_buy
    self.buy
  end
end
