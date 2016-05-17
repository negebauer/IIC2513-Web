class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :stock
      t.string :description
      t.integer :family

      t.timestamps null: false
    end
  end
end
