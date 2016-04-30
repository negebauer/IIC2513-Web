class StoreController < ApplicationController
  skip_before_action :set_name, only: [:index]
  def index
  end
end
