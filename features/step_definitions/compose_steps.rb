When /^I compose a bleat with content "(.*?)"$/ do |content|
  click_link 'Compose'
  within("form#new_bleat") do
    fill_in 'bleat[content]', :with => content
  end
  click_button 'post'
end
