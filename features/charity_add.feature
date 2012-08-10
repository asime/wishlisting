Feature: Adding a charity

As a charity admin I want to add a charity so that I can group wishlist items together for a given charity

Background:
 Given Amanda is on the Wishlisting home page
  And that Amanda has clicked the Add charity button

@add_charity
Scenario: Display the add charity form
 Then she should see a webform
 And where she can add the charity name and all applicable fields

@add_charity
Scenario: Add charity
 Given that Amanda has filled in all the fields
 When she clicks on Add button
 Then A successful message is displayed with the charity information

@add_charity
Scenario: Charity short_name must be unique, ignoring case sensitivity
 Given that Amanda has filled in all the fields
 When she clicks on Add button
 Then A successful message is displayed with the charity information
 Given Amanda is on the Wishlisting home page
 And that Amanda has clicked the Add charity button
 Given Amanda creates another charity with same short_name
 When she clicks on Add button
 Then an error message is displayed that the short_name is already taken
 Given Amanda is on the Wishlisting home page
 And that Amanda has clicked the Add charity button
 Given Amanda creates another charity with same short_name in upper case
 When she clicks on Add button
 Then an error message is displayed that the short_name is already taken
 Given Amanda is on the Wishlisting home page
 And that Amanda has clicked the Add charity button
 Given Amanda creates another charity with same short_name in lower case
 When she clicks on Add button
 Then an error message is displayed that the short_name is already taken

