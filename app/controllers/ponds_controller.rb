class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]

  def index
    @ponds = Pond.all
    'ponds#index'
  end

  def create
    Pond.create(valid_pond_params)
    redirect_to ponds_path
  end

  def new
    @pond = Pond.new
    'ponds/new'
  end

  def show
    'ponds/show'
  end

  def edit
    'ponds/edit'
  end

  def update
    @pond.update(valid_pond_params)
    redirect_to ponds_path
  end

  def destroy
    if @pond.destroy
      redirect_to ponds_path
    else
      "ERROR: cannot destroy pond. you realize you just destroyed a natural habitat for frogs, right?"
    end
  end

  private
    def set_pond
      @pond = Pond.find(params[:id])
    end

    def valid_pond_params
      params.require(:pond).permit(:name, :water_type)
    end
end
