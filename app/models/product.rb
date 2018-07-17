class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images 
  has_many :orders # product can be in a bunch of orders by diff users

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

  # def image
  #   Image.all 
  # end
end
