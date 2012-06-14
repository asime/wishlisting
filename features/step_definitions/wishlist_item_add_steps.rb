
Given /^Amanda creates a charity$/ do
  steps %Q{
      Given that Amanda has clicked the Add charity button
      When that Amanda has filled in all the fields
      Then she clicks on Add button
    }
  @@charity_id = find(:xpath, "//input[@id='charity_id']").value   
end

When /^Amanda clicks on Add Wishlist Item$/ do
  click_link('Add Wishlist Item')
end

When /^Amanda enters the Wishlist Item and Description$/ do
  fill_in "wishlist_item_charity_id", :with => @@charity_id
  fill_in "wishlist_item_item", :with => 'bogus item'
  fill_in "wishlist_item_description", :with => 'bogus desc'
end

When /^Amanda clicks on Save$/ do
  click_button('Create Wishlist item')
end

Then /^Amanda sees Wishlist item was successfully created on the page$/ do 
  page.should have_content("Wishlist item was successfully created.")  
end

Then /^the Charity ID, Wishlist Item and Description she entered are shown on the page$/ do
   page.should have_content("Charity: " + @@charity_id)
   page.should have_content("Item: bogus item")
   page.should have_content("Description: bogus desc")
end

When /^Amanda selects a file$/ do
   attach_file('image', Rails.root + 'app/assets/images/rails.png')
end

Then /^the image is displayed in the wish list view$/ do
  page.should have_content('src="assets/rails.png"')
end