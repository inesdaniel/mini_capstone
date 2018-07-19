json.id @order.id
json.user_id @order.user_id
json.product_id @order.product_id
json.quantity @order.quantity
json.subtotal number_to_currency(@order.subtotal) # adds $ to price to make it look like an acual price
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total) 

json.product @order.product #established with the belongs to relationship
json.user @order.user
