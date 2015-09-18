json.array!(@organisations) do |organisation|
  json.extract! organisation, :id, :name, :phone, :address, :email, :number_of_tabs, :organisation_id
  json.url organisation_url(organisation, format: :json)
end