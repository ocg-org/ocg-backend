require 'spec_helper'

describe "Region" do

  it "holds only rocks or regions" do
    r = FactoryGirl.create(:region, :name => "Sachsen")
    FactoryGirl.create(:region, :name => "Saechsische Schweiz", :parent_region => r)

    rock = Rock.new(:name => "false rock", :region => r)
    assert !rock.save, "Rock should not be saved to region which already holds child regions"

    r = FactoryGirl.create(:region, :name => "Franken")
    FactoryGirl.create(:rock, :region => r)
    region = Region.new(:name => "false region", :parent_region => r)
    assert !region.save, "Region should not be saved to parent region, which already holds rocks"

  end

end
