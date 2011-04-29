class EtsyHomePage < EtsySuperPage

  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  direct_url_suffix ""
  link :buy, :text => "Buy"

  def click_buy
    self.buy
    EtsyBuyPage.new(@browser)
  end
end
