Given /^a new bleat with the content \#winning$/ do
  create(:bleat, :content => "#winning")
end

When /^I visit the home page$/ do
  visit root_url
end

Then /^the first bleat on the home page should contain \#winning$/ do
  page.all(".bleat").first.should have_content("#winning")
end
