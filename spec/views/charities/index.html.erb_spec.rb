require 'spec_helper'

describe "charities/index" do
  before(:each) do
    assign(:charities, [
      stub_model(Charity,
        :charity_name => "Charity Name",
        :contact_name => "Contact Name",
        :email => "Email",
        :login => "Login",
        :password => "Password",
        :about => "MyText"
      ),
      stub_model(Charity,
        :charity_name => "Charity Name",
        :contact_name => "Contact Name",
        :email => "Email",
        :login => "Login",
        :password => "Password",
        :about => "MyText"
      )
    ])
  end

  it "renders a list of charities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Charity Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
