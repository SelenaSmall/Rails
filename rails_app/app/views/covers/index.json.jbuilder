json.array!(@covers) do |cover|
  json.extract! cover, :id, :covers, :covers_group, :turn_time, :cover_id,
  json.url cover_url(cover, format: :json)
end
