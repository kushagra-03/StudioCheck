require 'spec_helper'

describe "servers/show" do
  before(:each) do
    @server = assign(:server, stub_model(Server,
      :api_url => "Api Url",
      :username => "Username",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Api Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
  end
end
