class AdminController < ApplicationController
  before_action :user_admin_required

  def index
  end

end
