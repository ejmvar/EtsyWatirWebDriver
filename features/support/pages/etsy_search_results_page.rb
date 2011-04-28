class EtsySearchResultsPage < EtsyBasePage
  TITLE = /^.+ on Etsy, a global handmade and vintage marketplace\.$/

  attr_accessor :search_results, :spelling, :first_result_link

  def initialize browser
    @browser = browser
    @search_results = @browser.h1(:class => "summary")
    @spelling = @browser.p(:class => "spelling")
    @first_result_link = @browser.link(:class => "listing-thumb")
    super TITLE
  end

  def search_results_text
    self.search_results.text
  end

  def spelling_text
    self.spelling.text
  end

  def click_first_result
    self.first_result_link.click
    EtsyItemPage.new(@browser)
  end
end
