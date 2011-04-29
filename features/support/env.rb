BASE_URL = "http://www.etsy.com/"

require 'watir-webdriver'
require File.dirname(__FILE__)+'/watir_webdriver_helper'

browser = Watir::Browser.new :chrome

Before do
  @browser = browser
end

at_exit do
  browser.close
end