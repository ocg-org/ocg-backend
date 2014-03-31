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

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
