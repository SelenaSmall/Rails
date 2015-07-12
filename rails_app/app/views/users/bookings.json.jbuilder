json.array!(@bookings) do |booking|
  json.extract! booking, :id, :name, :phone, :email, :tab_name, :start_time, :user_id
  json.url booking_url(booking, format: :json)
end
