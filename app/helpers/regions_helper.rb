module RegionsHelper
  def breadcrumbs_for_region(region)
    str = "<ol class=\"breadcrumb\">"
    str += breadcrumb_recursion(region.parent_region) unless region.parent_region.nil?
    str += "<li class=\"active\">#{region.name}</li>"
    str += "</ol>"
    str
  end

end
