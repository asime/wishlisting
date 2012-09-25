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

@imageupload @external_url
Scenario: Add an image to a wishlist item with no images yet
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

@imageupload @external_url
Scenario: Add an image to a wishlist item with an existing image already
 Given Amanda is on show wishlist item and wishlist item has one existing image
 And Amanda has chosen a new image to add
 When Amanda clicks upload image
 Then show wishlist item displays the new and existing images

@imageupload @external_url
Scenario: Not an image file
 Given Amanda is on show wishlist item and wishlist item has one existing image
 And Amanda has chosen a non image to add
 When Amanda clicks upload image
 Then page shows message "File must be JPG, GIF, or PNG"
