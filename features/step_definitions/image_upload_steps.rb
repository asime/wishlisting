Given /^I am on the image test page$/ do
  visit('/image_upload/test')
end

Then /^I should see 'sample\.jpg' from Cloudinary$/ do
  page.should have_xpath("//img[contains(@src, \"sample.jpg\")]")
end
