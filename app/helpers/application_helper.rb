module ApplicationHelper
  def breadcrumb_recursion(region)
    if region.parent_region.nil?
      str = ""
    else
      str = breadcrumb_recursion(region.parent_region)
    end
    str += "<li>#{link_to region.name, region}</li>"
    str
  end
end
