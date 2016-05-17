class AddPromotionFieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :promotion, :boolean
  end
end
