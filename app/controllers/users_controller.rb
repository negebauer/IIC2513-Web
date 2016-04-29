class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def userAsk
    # si ya esta logueado, deberiamos hacer un redirect ...
  end

  def userRemember

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
    elsif password != user.password
      @error = "La clave esta mal"
    end

    # ###########
    # Fin de cosas que no van aqui
    # ###########

    if @error
      # ups, hay un error. Haremos render de
      # la accion que pide login: ask
      render 'userAsk'
    else
      # todo bien.
      # guardamos en sesion
      session[:user_id] = user.id

      # y redirigimos al inicio del juego
      # redirect_to game_start_path
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
