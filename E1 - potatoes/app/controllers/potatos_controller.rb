class PotatosController < ApplicationController

  def index
    @potatos = Potato.all
  end

  def show
    @potato = Potato.find(params[:id])
  end

  def new
    @potato = Potato.new
  end

  def edit
    @potato = Potato.find(params[:id])
  end

  def create
    @potato = Potato.new(potato_params)

    if @potato.save
      redirect_to @potato
    else
      render "new"
    end
  end

  def update
    @potato = Potato.find(params[:id])

    if @potato.update(potato_params)
      redirect_to @potato
    else
      render "new"
    end
  end

  def destroy
    @potato = Potato.find(params[:id])

    @potato.destroy
    redirect_to potatos_path
  end

  private
    def potato_params
      params.require(:potato).permit(:name, :description, :link)
    end

end
