require 'spec_helper'

describe "test_runs/index" do
  before(:each) do
    assign(:test_runs, [
      stub_model(TestRun,
        :server_id => 1,
        :test_id => 1,
        :result => false,
        :log => "MyText"
      ),
      stub_model(TestRun,
        :server_id => 1,
        :test_id => 1,
        :result => false,
        :log => "MyText"
      )
    ])
  end

  it "renders a list of test_runs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
