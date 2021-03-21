class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @brewer = Brewer.all
    @item = Item.all.order('created_at DESC')
    @item.includes(:item)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation).merge(user_id: current_user.id)
  end
end
