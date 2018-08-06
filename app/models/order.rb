class Order < ApplicationRecord
  has_many :order_items,dependent: :destroy
  has_one :completed_order
  

  before_save :update_total_amount
  
  def total_amount
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
  private
  
  def update_total_amount
    self[:total_amount] = total_amount
  end
  
end
