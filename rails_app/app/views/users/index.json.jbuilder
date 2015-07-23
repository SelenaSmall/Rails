json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone, :address, :email, :number_of_tabs, :user_id
  json.url user_url(user, format: :json)
end
