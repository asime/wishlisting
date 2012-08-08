Feature:  Display a wishlist for a charity

Background:
	Given Amanda creates a charity "AHIP"

Scenario: Display the wishlist for a charity
	Given Amanda visits the wishlist for "AHIP"
	Then the about text should be displayed
	
Scenario: Go to a wishlist that does not exist
	Given Amanda visits an invalid wishlist
	Then the page should display list not found