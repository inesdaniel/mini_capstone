# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create a product using seeds file
# product4 = Product.create(name: "stapler", price:4, image_url: "", description:"Holds papers together.")


#create supplier info
# supplier1 = Supplier.create(name: "BIC", email: "bic@gmail.com", phone_number: "333-3333")
# supplier2 = Supplier.create(name: "G2", email: "g2@gmail.com", phone_number: "444-4444")


#link product with a random supplier
suppliers = Supplier.all
products = Product.all

products.each do |product|
  product.supplier_id = suppliers.sample.id #going to supplier, picking out sample supplier, assigning id
  product.save
end
