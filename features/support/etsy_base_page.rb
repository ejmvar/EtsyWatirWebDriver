class EtsyBasePage

  def initialize(title, visit = false, url = "")
    @browser.goto url if visit
    title.kind_of?(Regexp) ? @browser.title.should =~ title : @browser.title.should == title
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end
end