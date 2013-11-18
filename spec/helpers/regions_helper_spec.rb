require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RegionsHelper. For example:
#
# describe RegionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe "Regions Helper" do

  it "builds breadcrumbs for the region tree" do
    root = FactoryGirl.create(:region)
    r = FactoryGirl.create(:region, :parent_region => root)
    x = FactoryGirl.create(:region, :parent_region => r)

    breadcrumbs = helper.breadcrumbs(x)
    expct_bc = "<ol class=\"breadcrumb\"><li>#{link_to root.name, root}</li><li>#{link_to r.name, r}</li><li class=\"active\">#{x.name}</li></ol>"

    assert_equal expct_bc, breadcrumbs

  end

end
