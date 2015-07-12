json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone, :address, :email, :start_date, opening_hours, number_of)tabs,
  json.url user_url(user, format: :json)
end
