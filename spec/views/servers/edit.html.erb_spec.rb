require 'spec_helper'

describe "servers/edit" do
  before(:each) do
    @server = assign(:server, stub_model(Server,
      :api_url => "MyString",
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => servers_path(@server), :method => "post" do
      assert_select "input#server_api_url", :name => "server[api_url]"
      assert_select "input#server_username", :name => "server[username]"
      assert_select "input#server_password", :name => "server[password]"
    end
  end
end
