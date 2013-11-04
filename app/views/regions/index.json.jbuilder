json.array!(@regions) do |region|
  json.extract! region, :name, :parent_region_id
  json.url region_url(region, format: :json)
end
