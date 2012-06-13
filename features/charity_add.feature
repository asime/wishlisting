Feature: Adding a charity

As a charity admin I want to add a charity so that I can group wishlist items together for a given charity

Background:
 Given Amanda is on the Wishlisting home page
  And that Amanda has clicked the Add charity button

Scenario: Display the add charity form
 Then she should see a webform
 And where she can add the charity name and all applicable fields

Scenario: Add charity
 Given that Amanda has filled in all the fields
 When she clicks on Add button
 Then A successful message is displayed with the charity information