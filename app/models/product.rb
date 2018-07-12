class Product < ApplicationRecord
  def discounted?
    price < 4
  end

  def tax
    price * 0.09
  end
  def total
    price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
