class EtsyHomePage < EtsyBasePage
  TITLE = "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  URL = BASE_URL

  attr_accessor :buy_link

  def initialize browser, visit = false
    @browser = browser
    @buy_link = @browser.link(:text => "Buy")
    super(TITLE, visit, URL)
  end

  def click_buy
    self.buy_link.click
    EtsyBuyPage.new(@browser)
  end
end
