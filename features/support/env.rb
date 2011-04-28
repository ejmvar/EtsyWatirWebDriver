BASE_URL = "http://www.etsy.com/"
TEST_DATA_DIR = "./features/support/test_data"

require 'watir-webdriver'
browser = Watir::Browser.new :chrome

Before do
  @browser = browser
end

at_exit do
  browser.close
end