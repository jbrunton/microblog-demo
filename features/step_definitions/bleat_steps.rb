Given /^a bleat with the content "(.*)"$/ do |content|
  create(:bleat, :content => content)
end

Given /^(\d+) bleats exist$/ do |count|
  for k in 1..count.to_i do
    create(:bleat)
  end
end

Given /^I have (\d+) bleats$/ do |count|
  for k in 1..count.to_i do
    create(:bleat, :user => @current_user)
  end
end

Then /^the first bleat should contain "(.*)"$/ do |content|
  page.all(".bleat").first.should have_content(content)
end

Then /^"(.*?)" should be a trending hashtag$/ do |hashtag|
  page.all(".trending").first.should have_content(hashtag)
end
