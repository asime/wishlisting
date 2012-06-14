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

@wip
Scenario: Add an image
 Given Amanda clicks on Add Wishlist Item
 When Amanda enters the Wishlist Item and Description  
 And Amanda selects a file
 And Amanda clicks on Save
 Then the image is displayed in the wish list view