class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :total_amount
      t.timestamps
    end
  end
end
