json.array!(@reviews) do |review|
  json.extract! review, :id, :reviewer_id, :movie_id, :rating, :content, :title
  json.url review_url(review, format: :json)
end
