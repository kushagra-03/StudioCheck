require 'spec_helper'

describe "test_descriptions/show" do
  before(:each) do
    @test_description = assign(:test_description, stub_model(TestDescription,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
