class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :description, presence: true
    validates :family, presence: true
    validates :image, presence: true
    validates :uuid, uniqueness: true

    def as_json(options={})
        super(options.merge(except: [:id]))
    end

    def self.uuids
        products = Product.all
        products = products.as_json(only: [:uuid])
        return products
    end
end
