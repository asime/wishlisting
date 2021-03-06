$TEST_IMAGE_PATH = "/app/assets/images/"
$TEST_IMAGE = "rails.png"
$TEST_IMAGE2 = "DTS_logo.gif"

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
  @@wishlist_item_id = current_path.split("/").last
end

Then /^Amanda sees Wishlist item was successfully created on the page$/ do 
  page.should have_content("Wishlist item was successfully created.")  
end

Then /^the Charity ID, Wishlist Item and Description she entered are shown on the page$/ do
   page.should have_content("Charity: " + @@charity_id)
   page.should have_content("Item: bogus item")
   page.should have_content("Description: bogus desc")
end

Given /^Amanda is on show Wishlist Item page$/ do
  current_path.should include("wishlist_items/" + @@wishlist_item_id.to_s)
end

Given /^Wishlist Item has no existing image$/ do
  page.should have_content("Please upload one or more images for this item.")
end

Given /^Amanda chooses an image$/ do
  attach_file "before_image", Rails.root.to_s + $TEST_IMAGE_PATH + $TEST_IMAGE
  find(:xpath, "//input[@id='before_image']").value.should == Rails.root.to_s + $TEST_IMAGE_PATH + $TEST_IMAGE
end

When /^Amanda clicks upload image$/ do
  click_button('Upload image')
end

Then /^show Wishlist item$/ do
  current_path.split("/").last.should == @@wishlist_item_id.to_s
end

Then /^page displays the new image$/ do
  cloud_image_name = Image.find(:first, :conditions => {:wishlist_item_id => @@wishlist_item_id}).image
  find(:xpath, "//img[@src='http://res.cloudinary.com/wishlisting-org/image/upload/#{cloud_image_name}']")
end

Then /^page shows message "(.*?)"$/ do |message|
  page.should have_content message
end

Given /^Amanda is on show wishlist item and wishlist item has one existing image$/ do
  steps %Q{
	Given Amanda clicks on Add Wishlist Item
	When Amanda enters the Wishlist Item and Description
	Then Amanda clicks on Save
	Given Amanda is on show Wishlist Item page
	And Wishlist Item has no existing image
	And Amanda chooses an image
	When Amanda clicks upload image
	Then show Wishlist item
	And page displays the new image
	And page shows message "Image uploaded successfully"
    } 
end

Given /^Amanda has chosen a new image to add$/ do
  attach_file "before_image", Rails.root.to_s + $TEST_IMAGE_PATH + $TEST_IMAGE2
  find(:xpath, "//input[@id='before_image']").value.should == Rails.root.to_s + $TEST_IMAGE_PATH + $TEST_IMAGE2
end

Then /^show wishlist item displays the new and existing images$/ do
  before_images = Image.find(:all, @@wishlist_item_id)
  before_images.length.should == 2
  before_images.each do | before_image |
	cloud_image_name = before_image.image
	find(:xpath, "//img[@src='http://res.cloudinary.com/wishlisting-org/image/upload/#{cloud_image_name}']")
  end
end

Given /^Amanda has chosen a non image to add$/ do
  attach_file "before_image", Rails.root.to_s + "/app/assets/javascripts/application.js"
end
