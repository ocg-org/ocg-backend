require 'spec_helper'

describe "rocks/edit" do
  before(:each) do
    @rock = assign(:rock, stub_model(Rock,
      :name => "MyString",
      :region_id => 1,
      :height => 1
    ))
  end

  it "renders the edit rock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rock_path(@rock), "post" do
      assert_select "input#rock_name[name=?]", "rock[name]"
      assert_select "input#rock_height[name=?]", "rock[height]"
    end
  end
end
