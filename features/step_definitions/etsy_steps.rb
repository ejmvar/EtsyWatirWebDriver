Given /^I am searching on Etsy\.com$/ do
  visit EtsyAdvancedSearchPage
end

Given /^I am on Etsy\.com$/ do
  visit EtsyHomePage
end

Given /^I am on the Etsy cart page$/ do
  visit EtsyCartPage
end

Given /^that the cart is empty$/ do
  on EtsyCartPage do |page|
    page.ensure_cart_empty
    page.items_in_cart.should == 0
  end
end

When /^I specify the (.+) sub category$/ do |sub_category|
  on EtsyAdvancedSearchPage do |page| page.specify_sub_category sub_category end
end

When /^I search for '(.+)'$/ do |search_term|
  on(EtsyAdvancedSearchPage) { |page| page.search_for search_term }
end

When /^I want to browse through a treasury gallery$/ do
  on EtsyHomePage do |page| page.click_buy end
  on EtsyBuyPage do |page| page.click_treasury_button end
end

When /^an item is added to the cart$/ do
  visit EtsyAdvancedSearchPage do |page| page.search_for "hat" end
  on EtsySearchResultsPage do |page| page.click_first_result end
  on EtsyItemPage do |page|
    @item_title = page.item_title
    page.click_add_to_cart
  end
end

Then /^I should see some search results for '(.+)'$/ do |search_term|
  on EtsySearchResultsPage do |page|
    page.search_results.should =~ /\d+,?\d* results for #{search_term}/
    page.search_results.should_not =~ /We didn't find anything for #{search_term}\./
  end
end

Then /^I should see no search results for '(.+)'$/ do |search_term|
  on EtsySearchResultsPage do |page|
    page.search_results.should =~ /We didn't find anything for #{search_term}\./
    page.search_results.should_not =~ /\d+,?\d* results for #{search_term}/
  end
end

Then /^I should see that the search was for '(.+)' instead of '(.+)'$/ do |new_search_term, search_term|
  on EtsySearchResultsPage do |page| page.spelling.should == "No results found for #{search_term}, searching instead for #{new_search_term}." end
end

Then /^results will be displayed in the gallery$/ do
  on EtsyTreasuryPage do |page|
    page.list_treasury_div.exists?.should be_true
    page.item_treasury_li.exists?.should be_true
    page.item_hotness_div.exists?.should be_true
    page.item_info_div.exists?.should be_true
    page.item_stats_div.exists?.should be_true
    page.item_preview_div.exists?.should be_true
  end
end

Then /^the cart contains that item$/ do
  on EtsyCartPage do |page|
    page.items_in_cart.should == 1
    page.first_item_name_text.should == @item_title
  end
end

When /^I remove the item from the cart$/ do
  on EtsyCartPage do |page| page.remove_item end
end

Then /^the cart is empty$/ do
  on EtsyCartPage do |page| page.items_in_cart.should == 0 end
end