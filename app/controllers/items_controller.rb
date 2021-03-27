class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item_id, only:[:show, :edit, :update, :destroy]

  def index
    @brewer = Brewer.all
    @item = Item.all
    @item.includes(:brewer)
    
  end

  def new
    @brewer = Brewer.find(params[:brewer_id])
    @item = Item.new
  end

  def create
    @brewer = Brewer.find(params[:brewer_id])
    @item = @brewer.items.new(item_params)
    if @item.save
      redirect_to brewer_path(@brewer)
    else
      render :new
    end
  end

  def show
    @brewer = Brewer.all
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @item.user_id
    redirect_to root_path
    end
    if @item.destroy 
    redirect_to brewer_path(@item.brewer_id)
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation).merge(user_id: current_user.id)
  end

  def set_item_id
    @item = Item.find(params[:id])
  end

end
