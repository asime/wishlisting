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
