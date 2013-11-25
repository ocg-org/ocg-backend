json.array!(@routes) do |route|
  json.extract! route, :name, :difficulty, :description, :rock_id
  json.url route_url(route, format: :json)
end
