Given /^I am on the image test page$/ do
  visit('/image_upload/test')
end

Then /^I should see 'sample\.jpg' from Cloudinary$/ do
  page.should have_xpath("//img[contains(@src, \"sample.jpg\")]")
end

Given /^I have a local file named "(.*?)"$/ do |filename|
  File.exists?(filename).should == true
  @localfile = filename
end

When /^I do a direct upload to cloudinary$/ do
  Cloudinary::Uploader.upload(File.open(@localfile))
end

Then /^I should be able to view that image in the browser at "(.*?)"$/ do |path|
  visit(path + @localfile)
end

