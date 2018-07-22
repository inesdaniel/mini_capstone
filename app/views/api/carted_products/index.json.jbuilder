json.array! @carted_product.each do |product|
  json.id product.id
  json.user_id product.user_id
  json.product_id product.product_id
  json.quantity product.quantity
  json.status product.status
end