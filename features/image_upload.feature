Feature:  Test Image Uploads with Cloudinary

@cloudinary
Scenario:  Display sample image from Cloudinary
	Given I am on the image test page
	Then I should see 'sample.jpg' from Cloudinary
