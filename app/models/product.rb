class Product < ActiveRecord::Base
    # validates :name, presence: true
    # validates :price, presence: true
    # validates :stock, presence: true
    # validates :description, presence: true
    # validates :family, presence: true
    # validates :image, presence: true
    validates :uuid, uniqueness: true

    def as_json(options={})
        result = super(options.merge(except: [:uuid]))
        result[:id] = "http://nidastore.herokuapp.com/api/v1/products/"
        if !uuid.nil?
            result[:id] += uuid
        end
        result
    end

    def self.uuids
        products = Product.all
        products = products.map{ |p| "http://nidastore.herokuapp.com/api/v1/products/" + p.uuid }
        return products
    end

    def self.required_params
        [:name, :price, :description, :image, :uuid]
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
