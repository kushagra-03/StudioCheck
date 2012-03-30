require 'spec_helper'

describe "test_descriptions/index" do
  before(:each) do
    assign(:test_descriptions, [
      stub_model(TestDescription,
        :description => "MyText"
      ),
      stub_model(TestDescription,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of test_descriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
