class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]

  def index
    @frogs = Frog.all
    'frogs#index'
  end

  def create
    @frog = Frog.create(valid_frog_params)
    redirect_to frogs_path
  end

  def new
    @ponds = Pond.all
    @frog = Frog.new
    'frogs#new'
  end

  def show
    'frogs#show'
  end

  def edit
    @ponds = Pond.all
    'frogs#edit'
  end

  def update
    @frog.update(valid_frog_params)
    redirect_to frogs_path
  end

  def destroy
    if @frog.destroy
      redirect_to frogs_path
    else
      "ERROR: cannot destroy frog. it's on the endagered list. HOW COULD YOU??!?!?"
    end
  end

  private
    def set_frog
      @frog = Frog.find(params[:id])
    end

    def valid_frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end
end
