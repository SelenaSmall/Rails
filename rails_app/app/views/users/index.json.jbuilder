json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :password, :first_name, :last_name, :email, :phone, :facebook, :last_name
  json.url user_url(user, format: :json)
end
