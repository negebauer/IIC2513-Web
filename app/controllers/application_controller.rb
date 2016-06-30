class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :user_session_set

  def user_session_set
    user_id = session[:user_id]
    if User.exists?(user_id)
      user = User.find(user_id)
      @current_user = user
    else
      @current_user = nil
    end
  end

  def user_session_required
    user_session_set
    if !@current_user || !@current_user.active
      session[:user_id] = nil
      @current_user = nil
      redirect_to login_path
      return
    end
  end
end

def user_admin_required
  user_session_required
  if @current_user && !@current_user.admin
    redirect_to profile_path
  end
end
