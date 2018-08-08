class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  before_save :finalize
  
  def unit_price
    product.price
  end
  
  def subtotal_amount
    (quantity * unit_price).round(2)
  end
  
  private
  
  def finalize
    self[:unit_price] = unit_price
    self[:subtotal_amount] = (quantity * self[:unit_price]).round(2)
  end
end
