json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :upvotes
  json.url user_url(user, format: :json)
end
