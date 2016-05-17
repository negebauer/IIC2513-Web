json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :stock, :description, :family, :promotion
  json.url product_url(product, format: :json)
end
