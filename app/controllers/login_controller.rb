class LoginController < ApplicationController
  skip_before_action :user_session_required, only: [:ask, :validate]

  def ask
    user_id = session[:user_id]
    if !user_id.nil? && User.exists?(user_id)
      redirect_to profile_path
    end
  end

  def validate
    name = params[:username]
    password = params[:pass]

    # ###########
    # Esto no debería estar aqui:
    # la "logica de negocios" (de login)
    # pertenece al modelo
    # ###########

    user = User.where(username: name).first
    if name.blank?
      @error = "Debes ingresar un usuario"
    elsif user.nil?
      @error = "Usuario desconocido"
    elsif !user.active
      @error = "Cuenta desactivada, contacta al admin"
    elsif password != user.password
      @error = "La clave esta mal"
    end

    # ###########
    # Fin de cosas que no van aqui
    # ###########

    if @error
      # ups, hay un error. Haremos render de
      # la accion que pide login: ask
      render 'ask'
    else
      # todo bien.
      # guardamos en sesion
      session[:user_id] = user.id

      # y redirigimos al inicio del juego
      redirect_to profile_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
