class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :description, presence: true
    validates :family, presence: true
    validates :image, presence: true
    validates :uuid, uniqueness: true

    def as_json(options={})
        super(uuid: "http://nidastore.herokuapp.com/api/v1/products/"+[:uuid])
        super(options.merge(except: [:id]))
    end

    def self.uuids
        products = Product.all
        products = products.as_json(only: [:uuid])
        return products
    end

    def self.required_params
        [:name, :price, :stock, :description, :family, :image, :uuid, :promotion]
    end

    def self.validate_params(params)
        for key in self.required_params
            if !params.key?(key)
                return false
            end
        end
        return true
    end
end
