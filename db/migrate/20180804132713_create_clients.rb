class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.text :information
      t.timestamps
    end
  end
end
