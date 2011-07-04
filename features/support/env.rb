BASE_URL = "http://www.etsy.com/"

require 'watir-webdriver'
require 'watir-page-helper'

$: << File.dirname(__FILE__)+'/../../lib'

require 'pages.rb'

module Browser
  BROWSER = Watir::Browser.new ENV['WEB_DRIVER'] ||:firefox

  def visit page_class, &block
    on page_class, true, &block
  end

  def on page_class, visit=false, &block
    page = page_class.new BROWSER, visit
    block.call page if block
    page
  end
end

World Browser

at_exit do
  Browser::BROWSER.close
end