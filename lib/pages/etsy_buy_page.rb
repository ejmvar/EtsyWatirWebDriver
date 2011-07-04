class EtsyBuyPage < BasePageClass

  expected_title "Etsy - Buy"
  link :treasury_button, :id => "treasury-panel-button"

  def click_treasury_button
    self.treasury_button
  end

end