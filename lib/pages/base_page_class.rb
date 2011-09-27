class BasePageClass
  include WatirPageHelper

  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
    #@browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end
end