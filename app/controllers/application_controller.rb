class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_name, except: ['userAsk', 'userRemember', 'show']

  def set_name
    user_id = session[:user_id]
    user = User.find(user_id)
    @current_user = user
    @name = user.username
  end
end
