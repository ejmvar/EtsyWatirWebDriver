class EtsySearchResultsPage < BasePageClass

  expected_title /.+ on Etsy, a global handmade and vintage marketplace\./
  h1 :search_results, :class => "summary"
  p :spelling, :class => "spelling"
  link :first_result, :class => "listing-thumb"

  def click_first_result
    first_result
  end
end