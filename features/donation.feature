Feature: Make a donation to charity

Background:
	Given Amanda creates a charity "AHIP"

@dts @wip
Scenario: Load the donation form and transfer to DTS
	Given Amanda visits the wishlist for "AHIP"
	When she fills out the donation form
	And she clicks donate
	Then she should be sent to a DTS URL