Feature:  Viewing Wishlist Items
As a donor I want to see what wishlist items are seeking donations so that I can decide what to donate to

Background:
 Given Amanda is on the Wishlisting home page
 And Amanda creates a charity
 When Amanda clicks on Add Wishlist Item
 And Amanda enters the Wishlist Item and Description
 And Amanda clicks on Save
 Then Amanda sees Wishlist item was successfully created on the page
 And the Charity ID, Wishlist Item and Description she entered are shown on the page

@wishlistitem
Scenario: 1 - Single Wishlist Item that has not met its goal
 Given there is one wishlist item that has not met its goal
 When Dave visits the charity home page
 Then the before image, charity, wishlist name, wishlist item description, total donation and goal is displayed at the top of the page.

@wip
Scenario: 2 - 4 Wishlist items that have not their goal
 Given there are 4 wishlist items that have not met their goal
 When Dave visits the home page
 Then the before image, charity, wishlist name, wishlist item description, total donation, and goal for each of the 4 wishlist items is displayed at the top of the page.

@wip
Scenario: 3 - 5 Wishlist items that have not met their goal
 Given there are 5 wishlist items that have not met their goal
 When Dave visits the home page
 Then the 4 newest wishlist items display at the top of the page with the following:
|    before image |
|    charity |
|    wishlist name |
|    wishlist item description |
 And the before image of the 5th oldest Wishlist Item displays on the bottom right of the page. 

@wip
Scenario: 4 - 6 Wishlist Items that have not met their goal
 Given there are 6 Wishlist Items that have not met their goal
 When Dave visits the home page
 Then the 4 newest wishlist items display at the top of the page with the following:
|    before image |
|    charity |
|    wishlist name |
|    wishlist item description |
 And the before images for the 5th and 6th oldest Wishlist Items are displayed on the bottom right of the page

@wip
Scenario: 5 - Wishlist Item has met its Goal
 GIVEN There is a Wishlist Item that has met its goal
 WHEN Dave visits the home page 
 THEN The Wishlist Item displays on the bottom left of the page showing the following:
|    after image |
|    charity |
|    wishlist item name |
|    wishlist item description |
|    Raised! wirth total donation amount |

@wip
Scenario: 6 - 2 Wishlist Items have met their goal
 GIVEN There are 2 Wishlist Items that have met their goals
 WHEN Dave visits the home page
 THEN the Wishlist Item that has most recently met its goal is shown on the bottom left of the page showing the following:
|    after image |
|    charity |
|    wishlist item name |
|    wishlist item description |
|    Raised! wirth total donation amount | 