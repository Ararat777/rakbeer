class OrderStatus < ApplicationRecord
  has_many :completed_orders
end
