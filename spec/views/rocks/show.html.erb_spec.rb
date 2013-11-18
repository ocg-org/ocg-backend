require 'spec_helper'

describe "rocks/show" do
  before(:each) do
    region = assign(:region, stub_model(Region,
      :name => "Name",
      :parent_region_id => nil,
    ))
    @rock = assign(:rock, stub_model(Rock,
      :name => "Name",
      :region => region,
      :height => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
