class CreateSalinities < ActiveRecord::Migration[5.1]
  def change
    create_table :salinities do |t|
      t.string :title
      t.timestamps
    end
  end
end
