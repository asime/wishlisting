Then /^the about text should be displayed$/ do
  page.should have_content($this_charity.about)
end

Given /^Amanda visits an invalid wishlist$/ do
  visit($homepage + "list/BOGUSNESS")
end

Then /^the page should display list not found$/ do
  page.should have_content("does not exist")
end