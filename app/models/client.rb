class Client < ApplicationRecord
  has_many :completed_orders
  
  validates :name,presence: {message: "ФИО обязательно"}
  validates :phone,presence: {message: "Телефон обязательно"}
end
