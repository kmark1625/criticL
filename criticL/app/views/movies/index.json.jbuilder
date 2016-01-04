json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :release_date, :runtime, :director, :cast, :poster_url, :avg_rating, :summary, :creator_id
  json.url movie_url(movie, format: :json)
end
