require 'spec_helper'

describe "rocks/new" do
  before(:each) do
    assign(:rock, stub_model(Rock,
      :name => "MyString",
      :region_id => 1,
      :height => 1
    ).as_new_record)
  end

  it "renders new rock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rocks_path, "post" do
      assert_select "input#rock_name[name=?]", "rock[name]"
      assert_select "input#rock_region_id[name=?]", "rock[region_id]"
      assert_select "input#rock_height[name=?]", "rock[height]"
    end
  end
end
