json.array!(@hours) do |hour|
  json.extract! hour, :id, :day, :open_time, :close_time, :interval, :covers_per_interval, 
  json.url hour_url(hour, format: :json)
end
