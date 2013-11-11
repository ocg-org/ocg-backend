json.array!(@rocks) do |rock|
  json.extract! rock, :name, :region_id, :height
  json.url rock_url(rock, format: :json)
end
