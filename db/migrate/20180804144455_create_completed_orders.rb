class CreateCompletedOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :completed_orders do |t|
      t.string :adress_delivery
      t.string :client_name
      t.string :client_phone
      t.belongs_to :payment_method
      t.belongs_to :order_status
      t.belongs_to :client
      t.belongs_to :order
      t.timestamps
    end
  end
end
