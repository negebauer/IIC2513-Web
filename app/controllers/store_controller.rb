class StoreController < ApplicationController

    @@page_item_max = 8

    def index
        @products = Product.where(promotion: true)
    end

    def computers
        @products = Product.where(family: 1)
        # respond_to do |format|
        #     format.js
        # end
    end

    def deodorants
        @products = Product.where(family: 2)
    end

    def product
        set_product
    end

    def products
        @family = product_params[:family]
        @page = product_params[:page]
        respond_to do |format|
            format.js
        end
    end

    private

    def set_product
        if Product.exists?(params[:id])
            @product = Product.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def product_params
        params.permit(:family, :id, :page)
    end
end
