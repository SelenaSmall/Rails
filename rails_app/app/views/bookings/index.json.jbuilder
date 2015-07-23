json.array!(@bookings) do |booking|
  json.extract! booking, :id, :name, :phone, :email, :booking_id
  json.url booking_url(booking, format: :json)
end
