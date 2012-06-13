Feature: Adding a charity

As a charity admin I want to add a charity so that I can group wishlist items together for a given charity

Background:
 Given Amanda is on the Wishlisting home page

Scenario: Display the add charity form
 Given that Amanda has clicked the Add charity button
 Then she should see a webform
 And where she can add the charity name and all applicable fields