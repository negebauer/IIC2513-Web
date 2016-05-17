class Admin::ProfileController < AdminController
  before_action :user_session_required

  def show
    @user = @current_user
  end
end
