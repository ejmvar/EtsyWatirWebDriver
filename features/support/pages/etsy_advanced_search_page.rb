class EtsyAdvancedSearchPage < EtsySuperPage

  expected_title "Etsy :: Advanced Search"
  direct_url_suffix "search_advanced.php"

  text_field :search_box, :id => "search_query"
  select_list :sub_category do |browser|
    browser.div(:class => "search-category").select_list
  end
  button :search do |browser|
    browser.div(:id => "advanced-search").button
  end

  def specify_sub_category sub_category
    self.sub_category = sub_category
  end

  def search_for search_term
    self.search_box = search_term
    search
    EtsySearchResultsPage.new(@browser)
  end
  
end
