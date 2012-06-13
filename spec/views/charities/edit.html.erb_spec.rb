require 'spec_helper'

describe "charities/edit" do
  before(:each) do
    @charity = assign(:charity, stub_model(Charity,
      :charity_name => "MyString",
      :contact_name => "MyString",
      :email => "MyString",
      :login => "MyString",
      :password => "MyString",
      :about => "MyText"
    ))
  end

  it "renders the edit charity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => charities_path(@charity), :method => "post" do
      assert_select "input#charity_charity_name", :name => "charity[charity_name]"
      assert_select "input#charity_contact_name", :name => "charity[contact_name]"
      assert_select "input#charity_email", :name => "charity[email]"
      assert_select "input#charity_login", :name => "charity[login]"
      assert_select "input#charity_password", :name => "charity[password]"
      assert_select "textarea#charity_about", :name => "charity[about]"
    end
  end
end
