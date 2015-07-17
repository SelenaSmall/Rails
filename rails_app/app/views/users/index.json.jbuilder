json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone, :email, :tab_name, :start_time, :user_id
  json.url user_url(user, format: :json)
end
