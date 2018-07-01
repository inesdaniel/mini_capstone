require 'unirest'

# access index action
# response = Unirest.get("http://localhost:3000/api/products")
# p response.body


# access show action 
# response = Unirest.get ("http://localhost:3000/api/products/3")
# p response.body


# implement create action
# p "Enter on each line a name of item, a description, a price and an image link."
# response = Unirest.post("http://localhost:3000/api/products", 
#   parameters: {
#     input_name: gets.chomp,
#     input_description: gets.chomp,
#     input_price: gets.chomp,
#     input_image_url: gets.chomp
#   }
# )
# p response.body

# update action
# p "Enter item to update:"
# product_id = gets.chomp
# response = Unirest.patch("http://localhost:3000/api/products/#{product_id}",
#   parameters: {
#     input_name: gets.chomp,
#     input_description: gets.chomp,
#     input_price: gets.chomp,
#     input_image_url: gets.chomp
#     }
#   )
# p response.body


#delete action
p "Enter item you want to delete"
product_id = gets.chomp
response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")
p response.body