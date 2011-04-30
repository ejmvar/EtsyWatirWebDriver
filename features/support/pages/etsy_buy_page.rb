class EtsyBuyPage < BasePageClass

  expected_title "Etsy - Buy"
  link :treasury_button, :id => "treasury-panel-button"

  def click_treasury_button
    self.treasury_button
    EtsyTreasuryPage.new(@browser)
  end

end