require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RoutesHelper. For example:
#
# describe RoutesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe RoutesHelper do
  it "builds breadcrumbs for the route" do

    root = FactoryGirl.create(:region)
    r = FactoryGirl.create(:region, :parent_region => root)
    x = FactoryGirl.create(:region, :parent_region => r)
    rock = FactoryGirl.create(:rock, :region => x)
    route = FactoryGirl.create(:route, :rock => rock)

    breadcrumbs = helper.breadcrumbs_for_route(route)
    expct_bc = "<ol class=\"breadcrumb\"><li>#{link_to root.name, root}</li><li>#{link_to r.name, r}</li><li>#{link_to x.name, x}</li><li>#{link_to rock.name, rock}</li><li class=\"active\">#{route.name}</li></ol>"

    assert_equal expct_bc, breadcrumbs
  end
end
