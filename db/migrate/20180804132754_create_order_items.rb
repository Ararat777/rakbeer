class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :subtotal_amount
      t.float :quantity
      t.float :unit_price
      t.belongs_to :product,index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
