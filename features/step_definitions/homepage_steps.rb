Given /^I am on the home page "(.*?)"$/ do |url|
  #pending
  visit(url)
end

Then /^I should see "(.*?)" on the page$/ do |content|
  page.should have_content(content)
end

Then /^I should see Add Charity$/ do
  find_link('Add Charity')
end