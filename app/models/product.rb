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
end
