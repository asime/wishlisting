$homepage = 'http://localhost:3000/' 
Given /^Amanda is on the Wishlisting home page$/ do
  visit($homepage)
end

Given /^that Amanda has clicked the Add charity button$/ do
  click_link('Add Charity')
end

Then /^she should see a webform$/ do
  current_path.should == '/charities/new'
end

Then /^where she can add the charity name and all applicable fields$/ do
  find_field('Charity name')
  find_field('charity_charity_name')
  find_field('Contact name')
  find_field('Email')
  find_field('Login')
  find_field('Password')
  find_field('About')
  find_field('charity_contact_name')
  find_field('charity_email')
  find_field('charity_login')
  find_field('charity_password')
  find_field('charity_about')
end

Given /^that Amanda has filled in all the fields$/ do
  fill_in "charity_charity_name", :with => 'Charity1 Name'
  fill_in "charity_short_name", :with => 'AHIP'
  fill_in "charity_dts_url", :with => 'https://secure.donortownsquare.com/SSL/process.aspx?ai=1349&qs=TYBNV'
  fill_in 'charity_contact_name', :with => 'Charity1 Contact'
  fill_in 'charity_email', :with => 'Charity1@email.com'
  fill_in 'charity_login', :with => 'Charity1_Login'
  fill_in 'charity_password', :with => 'Charity1_Pwd'
  fill_in 'charity_about', :with => 'Charity1 Desc'
end

When /^she clicks on Add button$/ do
  click_button('Create Charity')
end

Then /^A successful message is displayed with the charity information$/ do
  page.should have_content("Charity name: Charity1 Name")
  page.should have_content("AHIP")
  page.should have_content("Contact name: Charity1 Contact")
  page.should have_content("Email: Charity1@email.com")
  page.should have_content("Login: Charity1_Login")
  page.should have_content("Password: Charity1_Pwd")
  page.should have_content("About: Charity1 Desc")
  page.should have_content("Charity was successfully created.")
end

Given /^Amanda creates another charity with same short_name$/ do
  step "that Amanda has filled in all the fields"
end

Then /^an error message is displayed that the short_name is already taken$/ do
  page.should have_content("Short name has already been taken")
end

Given /^Amanda creates another charity with same short_name in upper case$/ do
  step "that Amanda has filled in all the fields"
  fill_in "charity_short_name", :with => find_field('charity_short_name').value.upcase
end

Given /^Amanda creates another charity with same short_name in lower case$/ do
  step "that Amanda has filled in all the fields"
  fill_in "charity_short_name", :with => find_field('charity_short_name').value.downcase
end