class StoreController < ApplicationController
    @@page_item_max = 8

    def index
        @family = 0
        @page = 0
        set_products(@family, @page)
    end

    def product
        set_product
    end

    def products
        @family = product_params[:family].to_i
        @page = product_params[:page].to_i

        set_products(@family, @page)

        respond_to do |format|
            format.js
        end
    end

    private

    def product_params
        params.permit(:family, :id, :page)
    end

    def set_product
        if Product.exists?(params[:id])
            @product = Product.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def set_products(family, page)
        first = page * @@page_item_max
        last = (page + 1) * @@page_item_max - 1
        @products = Product.where(family: family)[first..last]
    end
end
