require 'spec_helper'

describe "test_descriptions/new" do
  before(:each) do
    assign(:test_description, stub_model(TestDescription,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new test_description form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => test_descriptions_path, :method => "post" do
      assert_select "textarea#test_description_description", :name => "test_description[description]"
    end
  end
end
