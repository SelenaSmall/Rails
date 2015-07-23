json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :phone, :email, :user_id
  json.url customer_url(customer, format: :json)
end
