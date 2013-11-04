require 'spec_helper'

describe "regions/edit" do
  before(:each) do
    @region = assign(:region, stub_model(Region,
      :name => "MyString",
      :parent_region_id => 1
    ))
  end

  it "renders the edit region form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", region_path(@region), "post" do
      assert_select "input#region_name[name=?]", "region[name]"
      assert_select "input#region_parent_region_id[name=?]", "region[parent_region_id]"
    end
  end
end
