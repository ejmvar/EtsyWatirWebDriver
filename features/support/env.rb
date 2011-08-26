BASE_URL = "http://www.etsy.com/"

require 'watir-webdriver'
require 'watir-webdriver-performance'
require 'watir-page-helper'
require 'headless'


headless = Headless.new
headless.start

$: << File.dirname(__FILE__)+'/../../lib'

module Watir
  class Element
    alias_method :shown?, :exists?
  end
end

require 'pages.rb'
require 'page_metrics.rb'

module Metrics
  def self.page_metrics
    @page_metrics ||= PageMetrics.new
  end
end

module Browser
  DRIVER = ENV['WEB_DRIVER'] || :firefox
  BROWSER = Watir::Browser.new DRIVER

  def visit page_class, &block
    on page_class, true, &block
  end

  def on page_class, visit=false, &block
    page = page_class.new BROWSER, Metrics.page_metrics, visit
    block.call page if block
    page
  end

end

include Browser
World Browser

visit EtsyAdvancedSearchPage do |page|
  page.get_rid_of_annoying_locale_settings
end

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  if scenario.failed?
    Browser::BROWSER.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end

at_exit do
  puts Metrics.page_metrics.summary
  File.open('pagemetrics.yml', 'w') { |file| file.puts Metrics.page_metrics.summary }
  Browser::BROWSER.close
  headless.destroy
end