Feature:  Simple home page load

Scenario: Just load the home page
  Given I am on the home page "http://localhost:3000/"
  Then I should see "wishlisting.org" on the page
  And I should see Add Charity