Feature: Make a donation to charity

Background:
	Given Amanda creates a charity "AHIP"

@dts @wip
Scenario: Load the donation form and transfer to DTS
	Given Amanda visits the wishlist for "AHIP"
	When she fills out the donation form
	And she clicks donate
	Then she should be sent to a DTS URL
	
@dts @wip
Scenario: Mark a donation as processed when it is returned by DTS
	Given Amanda has already made a donation
	When the processor returns to the confirmation URL
	Then the donation should be marked as processed
	And Amanda should be sent to the wishlist thanks page