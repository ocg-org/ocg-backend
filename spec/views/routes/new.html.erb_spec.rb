require 'spec_helper'

describe "routes/new" do
  before(:each) do
    assign(:route, stub_model(Route,
      :name => "MyString",
      :difficulty => 1,
      :description => "MyText",
      :rock_id => 1
    ).as_new_record)
  end

  it "renders new route form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", routes_path, "post" do
      assert_select "input#route_name[name=?]", "route[name]"
      assert_select "input#route_difficulty[name=?]", "route[difficulty]"
      assert_select "textarea#route_description[name=?]", "route[description]"
      assert_select "input#route_rock_id[name=?]", "route[rock_id]"
    end
  end
end
