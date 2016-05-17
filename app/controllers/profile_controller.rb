class ProfileController < ApplicationController
  before_action :user_session_required

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @current_user.update(user_params)
        format.html { redirect_to profile_path, notice: 'El usuario fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
