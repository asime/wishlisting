require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :image => "",
      :description => "MyString",
      :type => false
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path, :method => "post" do
      assert_select "input#image_image", :name => "image[image]"
      assert_select "input#image_description", :name => "image[description]"
      assert_select "input#image_type", :name => "image[type]"
    end
  end
end
