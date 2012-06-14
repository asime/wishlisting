require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :image => "",
        :description => "Description",
        :type => false
      ),
      stub_model(Image,
        :image => "",
        :description => "Description",
        :type => false
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
