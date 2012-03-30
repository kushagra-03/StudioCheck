require 'spec_helper'

describe "test_runs/edit" do
  before(:each) do
    @test_run = assign(:test_run, stub_model(TestRun,
      :server_id => 1,
      :test_id => 1,
      :result => false,
      :log => "MyText"
    ))
  end

  it "renders the edit test_run form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => test_runs_path(@test_run), :method => "post" do
      assert_select "input#test_run_server_id", :name => "test_run[server_id]"
      assert_select "input#test_run_test_id", :name => "test_run[test_id]"
      assert_select "input#test_run_result", :name => "test_run[result]"
      assert_select "textarea#test_run_log", :name => "test_run[log]"
    end
  end
end
