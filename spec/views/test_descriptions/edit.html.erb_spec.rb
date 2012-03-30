require 'spec_helper'

describe "test_descriptions/edit" do
  before(:each) do
    @test_description = assign(:test_description, stub_model(TestDescription,
      :description => "MyText"
    ))
  end

  it "renders the edit test_description form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => test_descriptions_path(@test_description), :method => "post" do
      assert_select "textarea#test_description_description", :name => "test_description[description]"
    end
  end
end
