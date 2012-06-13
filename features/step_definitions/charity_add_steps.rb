Given /^Amanda is on the Wishlisting home page$/ do
  visit('http://localhost:3000/')
end

Given /^that Amanda has clicked the Add charity button$/ do
  click_link('Add Charity')
end

Then /^she should see a webform$/ do
  current_path.should == '/charities/new'
end

Then /^where she can add the charity name and all applicable fields$/ do
  find_field('Charity name')
  find_field('Contact name')
  find_field('Email')
  find_field('Login')
  find_field('Password')
  find_field('About')
end