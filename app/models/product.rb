class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :family, presence: true
end
