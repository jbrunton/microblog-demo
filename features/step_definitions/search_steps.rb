When /^I search for "(.*?)"$/ do |query|
  fill_in 'search-box', :with => query
  click_button 'search-submit'
end
