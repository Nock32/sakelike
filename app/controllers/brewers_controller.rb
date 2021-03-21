class BrewersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @brewer = Brewer.all.order('created_at DESC')
    @brewer.includes(:brewer)
  end

  def new
    @brewer = Brewer.new
  end

  def show
    @brewer = Brewer.find(params[:id])
  end

  def create
    @brewer = Brewer.new(brewer_params)
    if @brewer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user.id != @brewer.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @brewer.update(brewer_params)
      redirect_to brewer_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @brewer.user_id
    redirect_to root_path
    end

    if @brewer.destroy 
    redirect_to root_path
    else
    render :show
    end


  end

  private

  def brewer_params
    params.require(:brewer).permit(:name, :explanation, :address, :area_id).merge(user_id: current_user.id)
  end

  def set_item
    @brewer = Brewer.find(params[:id])
  end

end