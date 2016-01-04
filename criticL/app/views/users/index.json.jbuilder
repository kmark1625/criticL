json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_hash, :upvotes
  json.url user_url(user, format: :json)
end
