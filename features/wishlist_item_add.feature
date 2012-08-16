Feature: Adding a wishlist item to a charity

As a Charity Admin I want to add a wishlist item so that people can donate for a specific purpose

Background:
 Given Amanda is on the Wishlisting home page
 And Amanda creates a charity

Scenario: Add a wishlist item to a specific charity
 When Amanda clicks on Add Wishlist Item
 And Amanda enters the Wishlist Item and Description
 And Amanda clicks on Save
 Then Amanda sees Wishlist item was successfully created on the page
 And the Charity ID, Wishlist Item and Description she entered are shown on the page

@imageupload
Scenario: Add an image to a wishlist item
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
