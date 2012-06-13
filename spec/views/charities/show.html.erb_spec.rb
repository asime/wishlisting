require 'spec_helper'

describe "charities/show" do
  before(:each) do
    @charity = assign(:charity, stub_model(Charity,
      :charity_name => "Charity Name",
      :contact_name => "Contact Name",
      :email => "Email",
      :login => "Login",
      :password => "Password",
      :about => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Charity Name/)
    rendered.should match(/Contact Name/)
    rendered.should match(/Email/)
    rendered.should match(/Login/)
    rendered.should match(/Password/)
    rendered.should match(/MyText/)
  end
end
