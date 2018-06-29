require 'unirest'

# response = Unirest.get("http://localhost:3000/api/products")

# p response.body

# p "************************"

# response = Unirest.get ("http://localhost:3000/api/products/3")

# p response.body

#create

response = Unirest.post("http://localhost:3000/api/products", 
  parameters: {
    input_name: "ruler",
    input_description: "Measures things.",
    input_price: 1,
    input_image_url: ""
  }
)

p response.body


    # input_name: params[:input_name],
    # input_description: params[:input_description],
    # input_price: params[:input_price],
    # input_image_url: params[:input_image_url]