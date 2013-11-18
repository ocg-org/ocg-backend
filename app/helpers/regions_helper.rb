module RegionsHelper
  def breadcrumbs(region)
    str = "<ol class=\"breadcrumb\">"
    str += bc_rec(region.parent_region) unless region.parent_region.nil?
    str += "<li class=\"active\">#{region.name}</li>"
    str += "</ol>"
    str
  end

  def bc_rec(region)
    if region.parent_region.nil?
      str = ""
    else
      str = bc_rec(region.parent_region)
    end
    str += "<li>#{link_to region.name, region}</li>"
    str
  end
end
