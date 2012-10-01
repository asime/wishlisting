Feature: Make a test charge to WePay
#bundle exec cucumber --tags @wepay
#Also need rails s running in another tab

Background:
	Given I have a wepay object for wishlisting
	Given I have an access code already
	
@wepay @external_url
Scenario:  Make a simple charge
	When I create a checkout
	Then I am redirected to the wepay page for payment
	When I enter my payment
	And I confirm my payment
	Then I am redirected back to wishlisting.org