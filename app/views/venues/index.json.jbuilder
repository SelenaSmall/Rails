json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :phone, :email, :address, :venue_id
  json.url venue_url(venue, format: :json)
end