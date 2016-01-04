json.array!(@classifications) do |classification|
  json.extract! classification, :id, :movie_id, :genre_id
  json.url classification_url(classification, format: :json)
end
