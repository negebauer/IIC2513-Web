class AddUuidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :uuid, :string
  end
end
