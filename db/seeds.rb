# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PaymentMethod.delete_all
PaymentMethod.create!(:title => "Наличный расчет")
PaymentMethod.create!(:title => "Безналичный расчет")

OrderStatus.delete_all
OrderStatus.create!(id: 1,:title => "Новый")
OrderStatus.create!(id: 2,:title => "Приготовление")
OrderStatus.create!(id: 3,:title => "В Доставке")
OrderStatus.create!(id: 4,:title => "Завершен")
OrderStatus.create!(id: 5,:title => "Не доставлен")
OrderStatus.create!(id: 6,:title => "Отказ")
