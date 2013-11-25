module RoutesHelper
  def breadcrumbs_for_route(route)
    str = "<ol class=\"breadcrumb\">"
    if !route.rock.nil?
      str += breadcrumb_recursion(route.rock.region)
      str += "<li>#{link_to route.rock.name, route.rock}</li>"
    end
    str += "<li class=\"active\">#{route.name}</li>"
    str += "</ol>"
    str
  end
end
