json.array!(@universities) do |university|
  json.extract! university, :id, :name, :address, :coordinates
  json.url university_url(university, format: :json)
end
