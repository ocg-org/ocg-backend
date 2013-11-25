require 'spec_helper'

describe "routes/show" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :name => "Name",
      :difficulty => 1,
      :description => "MyText",
      :rock_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
