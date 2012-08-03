require 'spec_helper'

describe "donations/show" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fname/)
    rendered.should match(/Lname/)
    rendered.should match(/9.99/)
    rendered.should match(/Street1/)
    rendered.should match(/Street2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Postal/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/false/)
  end
end
