class CreateCompletedOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :completed_orders do |t|
      t.string :adress_delivery
      t.string :client_name
      t.string :client_phone
      t.text :comment
      t.datetime :completed_at
      t.belongs_to :payment_method,index: true
      t.belongs_to :order_status,index: true
      t.belongs_to :client,index: true
      t.belongs_to :order,index: true
      t.timestamps
    end
  end
end
