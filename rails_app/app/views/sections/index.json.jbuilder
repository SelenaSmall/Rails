json.array!(@sections) do |section|
  json.extract! section, :id, :section, :first_num, :last_num, :bookable
  json.url section_url(section, format: :json)
end
