json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :salt, :email, :avatar, :role
  json.url user_url(user, format: :json)
end