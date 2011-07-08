class BasePageClass
  include WatirPageHelper

  def initialize browser, visit = false
    @browser = browser
    goto if visit
    if @browser.button(:value => 'Okay').exist?
      @browser.button(:value => 'Okay').click if @browser.button(:value => 'Okay').visible?
      sleep 0.2
    end
    has_expected_title? if respond_to? :has_expected_title?
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end
end