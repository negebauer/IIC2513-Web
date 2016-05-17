class CreatePotatos < ActiveRecord::Migration
  def change
    create_table :potatos do |t|
      t.string :name
      t.string :description
      t.string :link

      t.timestamps null: false
    end
  end
end
