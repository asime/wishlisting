$homepage = 'http://localhost:3000/'

Given /^Amanda creates a charity "(.*?)"$/ do |charity_name|
  step "Amanda is on the Wishlisting home page"
  step "that Amanda has clicked the Add charity button"
  step "she should see a webform"
  step "that Amanda has filled in all the fields"
  step "Amanda sets the charity name to \"" + charity_name + "\""
  step "she clicks on Add button"
  @@charity_id = Charity.find_by_charity_name(charity_name).id
end

Given /^Amanda sets the charity name to "(.*?)"$/ do |charity_name|
  fill_in "charity_charity_name", :with => charity_name
  fill_in "charity_short_name", :with => charity_name
end

Given /^Amanda visits the wishlist for "(.*?)"$/ do |charity_name|
  $this_charity = Charity.find_by_charity_name(charity_name)
  visit($homepage + "list/" + $this_charity.short_name)
  page.should have_content(charity_name)
end

When /^she fills out the donation form$/ do
  fill_in "donation_fname", :with => 'Cucumber'
  fill_in "donation_lname", :with => 'Test'
  fill_in "donation_street1", :with => 'P.O. Box 156'
  fill_in "donation_city", :with => 'Crozet'
  fill_in "donation_state", :with => 'VA'
  fill_in "donation_postal", :with => '22932'
  fill_in "donation_email", :with => 'Arin@ArinSime.com'
  fill_in "donation_amount", :with => '19.99'
end

When /^she clicks donate$/ do
  click_button('Donate !')
end

Then /^she should be sent to a DTS URL$/ do
  current_path.should have_content('.aspx')
  #TODO: I should also check that the fields are being passed in the URL
end

Given /^Amanda has already made a donation$/ do
  steps %Q{
      Given Amanda visits the wishlist for "AHIP"
      When she fills out the donation form
    	And she clicks donate
    }
end

When /^the processor returns to the confirmation URL$/ do
  #We are going to assume the last donation is the right one
  $last_donation = Donation.last
  $last_donation.fname.should == "Cucumber"
  
  #We are going to go to this confirmation URL ourselves,
  #to simulate what the credit card processor should do
  #Note this assumes the this_charity object is set in previous steps
  @return_url = $homepage + "list/" + $this_charity.short_name + "/return?donation=" + $last_donation.id.to_s
  puts "Return URL: " + @return_url + " [EOL]"
  visit(@return_url)
end

Then /^the donation should be marked as processed$/ do
  $last_donation = Donation.find($last_donation.id)
  $last_donation.processed.should == true
end

Then /^Amanda should be sent to the wishlist thanks page$/ do
  current_path.should have_content('thanks')
  page.should have_content $last_donation.fname
  page.should have_content $last_donation.amount
  page.should have_content $this_charity.charity_name
end

Given /^Amanda selects a wishlist item$/ do
  charity = Charity.find(@@charity_id)
  click_link "#{charity.short_name}1"
end

Given /^Amanda enters a donation amount$/ do
  fill_in "amount", :with => '19.99'
  page.should have_content "Still needs"
  click_button "submitQuery"
end

When /^Amanda returns to the thank you page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^she should see the dollar amount of her donation$/ do
  pending # express the regexp above with the code you wish you had
end

