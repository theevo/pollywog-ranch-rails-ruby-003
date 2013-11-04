class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :evolve]

  def index
    @tadpoles = Tadpole.all
    'tadpoles#index'
  end

  def create
    @tadpole = Tadpole.create(valid_tadpole_params)
    redirect_to tadpoles_path
  end

  def new
    @frog = Frog.find(params[:frog_id])
    @tadpole = Tadpole.new(:frog_id => @frog.id)
    'tadpoles#new'
  end

  def show
    'tadpoles#show'
  end

  def edit
    'tadpoles#edit'
  end

  def update
    @tadpole.update(valid_tadpole_params)
    redirect_to tadpole_path
  end

  def destroy
    if @tadpole.destroy
      redirect_to tadpoles_path
    else
      "Error: couldn't destroy tadpole. IT'S JUST A BABY! HOW COULD YOU?!?!"
    end
  end

  def evolve
    @frog_parent = Frog.find(@tadpole.frog_id)
    Frog.create(
      :name => @tadpole.name,
      :color => @tadpole.color,
      :pond_id => @frog_parent.pond_id)
    @tadpole.destroy
    redirect_to frogs_path
  end

  private
    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

    def valid_tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end
end
