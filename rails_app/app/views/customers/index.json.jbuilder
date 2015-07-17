json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :phone, :email, :tab_name, :start_time, :user_id
  json.url customer_url(customer, format: :json)
end
