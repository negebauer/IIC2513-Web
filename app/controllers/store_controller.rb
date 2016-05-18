class StoreController < ApplicationController

  def index
  end

  def computers
  end

  def deodorants
  end

  def product
    set_product
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:id).permit()
    end
end
