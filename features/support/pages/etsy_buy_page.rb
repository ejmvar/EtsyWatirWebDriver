class EtsyBuyPage < EtsyBasePage
  TITLE = "Etsy - Buy"

  attr_accessor :treasury_button

  def initialize browser
    @browser = browser
    @treasury_button = @browser.link(:id => "treasury-panel-button")
    super TITLE
  end

  def click_treasury_button
    self.treasury_button.click
    EtsyTreasuryPage.new(@browser)
  end
end