class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :subtotal_amount
      t.integer :quantity
      t.float :unit_price
      t.belongs_to :product
      t.belongs_to :order
      t.timestamps
    end
  end
end
