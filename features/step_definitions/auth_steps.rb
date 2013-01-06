Given /^I am authenticated$/ do
  @current_user = create(:user)
  visit '/sign_in'
  within("form#new_user") do
    fill_in 'Email', :with => @current_user.email
    fill_in 'Password', :with => @current_user.password
  end
  click_button "Sign in"
end

Given /^I am not authenticated$/ do
  # nothing required
end
