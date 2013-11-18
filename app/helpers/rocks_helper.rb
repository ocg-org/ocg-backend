module RocksHelper
  def breadcrumbs_for_rock(rock)
    str = "<ol class=\"breadcrumb\">"
    str += breadcrumb_recursion(rock.region)
    str += "<li class=\"active\">#{rock.name}</li>"
    str += "</ol>"
    str
  end

end
