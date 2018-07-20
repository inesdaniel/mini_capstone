class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images 
  has_many :orders # product can be in a bunch of orders by diff users
  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products


  def discounted?
    price < 4
  end

  def tax
    price * 0.09
  end
  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end


#get all the images with the same product_id as the image being called, from images table
  # def image
  #   Image.where(product_id: id) 
  # end
end
