class EtsyHomePage
  include PageMixIn

  URLS = { :production => "http://www.etsy.com/" }
  TITLE = "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"

  attr_accessor :buy_link

  def initialize(browser, visit = false)
    @browser = browser
    @buy_link = @browser.link(:text => "Buy")
    @browser.goto URLS[:production] if visit
    @browser.title.should == TITLE
    super
  end

  def click_buy
    self.buy_link.click
    EtsyBuyPage.new(@browser)
  end
end
