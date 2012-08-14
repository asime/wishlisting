Feature:  Test Image Uploads with Cloudinary

@cloudinary
Scenario:  Display sample image from Cloudinary
	Given I am on the image test page
	Then I should see 'sample.jpg' from Cloudinary

@cloudinary @wip
Scenario: Upload an image to cloudinary
	Given I have a local file named "rails.png"
	When I do a direct upload to cloudinary
	Then I should be able to view that image in the browser at "http://res.cloudinary.com/wishlisting-org/image/upload/rails.png"
