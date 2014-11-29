json.array!(@universities) do |university|
  json.extract! university, :id, :name, :adress, :lat, :lng
  json.url university_url(university, format: :json)
end
