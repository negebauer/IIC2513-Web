class StoreController < ApplicationController
  before_action :page_count_set, only: [:index, :computers, :deodorants, :product]

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

    def page_count_set
        @page_count = 0
        @page_count_max = 10
    end
end
