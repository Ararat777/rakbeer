class PaymentMethod < ApplicationRecord
  has_many :completed_orders
end
