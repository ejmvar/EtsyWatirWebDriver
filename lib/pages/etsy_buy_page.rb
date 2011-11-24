class EtsyBuyPage < BasePageClass

  expected_title "Etsy - Buy"
  link :treasury_button, :title => 'Treasury'

  def click_treasury_button
    self.treasury_button
  end

end