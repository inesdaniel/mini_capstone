require 'unirest'

response = Unirest.get("http://localhost:3000/api/first_product_url")

p response.body

response = Unirest.get("http://localhost:3000/api/all_products_url")

p response.body