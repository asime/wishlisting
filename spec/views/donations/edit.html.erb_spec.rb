require 'spec_helper'

describe "donations/edit" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
      :fname => "MyString",
      :lname => "MyString",
      :amount => "9.99",
      :street1 => "MyString",
      :street2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :processed => false
    ))
  end

  it "renders the edit donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => donations_path(@donation), :method => "post" do
      assert_select "input#donation_fname", :name => "donation[fname]"
      assert_select "input#donation_lname", :name => "donation[lname]"
      assert_select "input#donation_amount", :name => "donation[amount]"
      assert_select "input#donation_street1", :name => "donation[street1]"
      assert_select "input#donation_street2", :name => "donation[street2]"
      assert_select "input#donation_city", :name => "donation[city]"
      assert_select "input#donation_state", :name => "donation[state]"
      assert_select "input#donation_postal", :name => "donation[postal]"
      assert_select "input#donation_email", :name => "donation[email]"
      assert_select "input#donation_phone", :name => "donation[phone]"
      assert_select "input#donation_processed", :name => "donation[processed]"
    end
  end
end
