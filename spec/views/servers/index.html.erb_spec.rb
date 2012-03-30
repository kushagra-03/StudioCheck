require 'spec_helper'

describe "servers/index" do
  before(:each) do
    assign(:servers, [
      stub_model(Server,
        :api_url => "Api Url",
        :username => "Username",
        :password => "Password"
      ),
      stub_model(Server,
        :api_url => "Api Url",
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of servers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Api Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
