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
      if Product.exists?(params[:id])
        @product = Product.find(params[:id])
      else
        redirect_to root_path
      end
    end

    def product_params
      params.require(:id).permit()
    end
end
