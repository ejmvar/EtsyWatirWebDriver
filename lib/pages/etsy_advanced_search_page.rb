class EtsyAdvancedSearchPage < BasePageClass

  expected_title "Etsy :: Advanced Search"
  direct_url BASE_URL + "search_advanced.php"

  text_field :search_box, :id => "search_query"
  select_list :sub_category do |page|
    page.div(:class => "search-category").when_present.select_list
  end
  button :search do |page|
    page.div(:id => "advanced-search").button
  end
  button :accept_locale, :value => 'Okay'


  def specify_sub_category sub_category
    self.sub_category = sub_category
  end

  def search_for search_term
    self.search_box = search_term
    search
  end

  def get_rid_of_annoying_locale_settings
    accept_locale_button.when_present.click
    accept_locale_button.wait_while_present
  end
end