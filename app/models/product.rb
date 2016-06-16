class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :description, presence: true
    validates :family, presence: true
    validates :image, presence: true
    validates :uuid, uniqueness: true
end
