Given /^there is one wishlist item that has not met its goal$/ do
  @@wishlist_item = WishlistItem.find(1)
  @@wishlist_item.goal = 50
  @@wishlist_item.save
end

When /^Dave visits the charity home page$/ do
  @@charity = Charity.find(@@wishlist_item.charity_id)
  visit $homepage + '/list/' + @@charity.short_name
end

Then /^the before image, charity, wishlist name, wishlist item description, total donation and goal is displayed at the top of the page\.$/ do
  page.should have_content @@charity.charity_name
  page.should have_content @@wishlist_item.description
  page.should have_content @@wishlist_item.item
  page.should have_content @@wishlist_item.goal
  page.should have_content @@wishlist_item.progressAgainstGoal
  
  #Check for the before images
  @before_images = Image.find(:all, :conditions => { :wishlist_item_id => @@wishlist_item.id, :image_type => false })
  @before_images.each do | before_image |
    page.should have_content before_image.description
  end
end

Given /^there are (\d+) wishlist items that have not met their goal$/ do |item_count|
  #Assume one wishlist item was already created, so we'll just create the rest
  items = /(\d+)$/.match(item_count)[0].to_i - 1
  items.times do
    visit '/charities/1'
    steps %Q{
      When Amanda clicks on Add Wishlist Item
      And Amanda enters the Wishlist Item and Description
    }
    fill_in "wishlist_item_goal", :with => 50+items
    steps %Q{
      And Amanda clicks on Save
      Then Amanda sees Wishlist item was successfully created on the page
      And the Charity ID, Wishlist Item and Description she entered are shown on the page
    }
  end
end

Then /^the before image, charity, wishlist name, wishlist item description, total donation, and goal for each of the (\d+) wishlist items is displayed at the top of the page\.$/ do |item_count|
  items = /(\d+)$/.match(item_count)[0].to_i
  items.times do |item_number|
    @@wishlist_item = WishlistItem.find(item_number+1)
    @@charity = Charity.find(@@wishlist_item.charity_id)
    visit $homepage + '/list/' + @@charity.short_name
    page.should have_content @@charity.charity_name
    page.should have_content @@wishlist_item.description
    page.should have_content @@wishlist_item.item
    page.should have_content @@wishlist_item.goal
    page.should have_content @@wishlist_item.progressAgainstGoal
  end
end
