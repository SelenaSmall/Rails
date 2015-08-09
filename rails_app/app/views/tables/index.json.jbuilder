json.array!(@tables) do |table|
  json.extract! table, :id, :tab, :section, :min_covers, :max_covers, :booking_order
  json.url table_url(table, format: :json)
end
