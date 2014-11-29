json.array!(@lectors) do |lector|
  json.extract! lector, :id, :name, :position
  json.url lector_url(lector, format: :json)
end
