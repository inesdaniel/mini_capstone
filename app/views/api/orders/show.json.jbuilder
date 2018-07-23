json.id @order.id
json.user_id @order.user_id
json.subtotal number_to_currency(@order.subtotal) # adds $ to price to make it look like an acual price
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total) 

json.user @order.user
json.carted_products do 
  json.array! @order.carted_products, partial: "api/carted_products/carted_product", as: :carted_product
end
