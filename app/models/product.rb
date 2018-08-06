class Product < ApplicationRecord
  has_many :order_items
  
  validates :title,presence: {message: "Название обязательно"}
  validates :price,presence: {message: "Цена обязательно"}
end
