require 'spec_helper'

describe "donations/index" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation,
        :fname => "Fname",
        :lname => "Lname",
        :amount => "9.99",
        :street1 => "Street1",
        :street2 => "Street2",
        :city => "City",
        :state => "State",
        :postal => "Postal",
        :email => "Email",
        :phone => "Phone",
        :processed => false
      ),
      stub_model(Donation,
        :fname => "Fname",
        :lname => "Lname",
        :amount => "9.99",
        :street1 => "Street1",
        :street2 => "Street2",
        :city => "City",
        :state => "State",
        :postal => "Postal",
        :email => "Email",
        :phone => "Phone",
        :processed => false
      )
    ])
  end

  it "renders a list of donations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Street1".to_s, :count => 2
    assert_select "tr>td", :text => "Street2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
