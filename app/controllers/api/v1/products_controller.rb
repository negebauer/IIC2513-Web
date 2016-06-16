class Api::V1::ProductsController < Api::V1::BaseController
    before_action :set_params, only: [:update]

    def index
        render json: Product.all.as_json(only: [:uuid]), status: 200
    end

    def update
        puts '--- Params qlos ---'
        puts params
        product = Product.where(uuid: @uuid).first
        if product.nil?
            Product.create(params)
        else
            if product.update(params)
                render json: product.to_json, status: 201
            else
                render json: {'message': 'failure'}, status: 500
            end
        end
    end

    private

    def set_params
        unless params[:id].nil?
            @uuid = params[:id]
        end
        params.delete(:controller)
        params.delete(:id)
        params.delete(:action)
        params.permit(:name, :price, :stock, :description, :family, :promotion, :image)
    end
end
