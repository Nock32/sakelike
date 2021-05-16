class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item_id, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'トップページ', :root_path

  def index
    add_breadcrumb '日本酒の詳細'
    @brewer = Brewer.all
    @item = Item.all
    @item.includes(:brewer)
    @q = Item.ransack(params[:q])
    @item = @q.result
    @item = Item.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def new
    @brewer = Brewer.find(params[:brewer_id])
    add_breadcrumb '酒蔵の情報', brewer_path(@brewer.id)
    add_breadcrumb '日本酒のデータベース', brewer_items_path(@brewer.id)
    add_breadcrumb '日本酒の登録'
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
    add_breadcrumb '日本酒のデータベース', brewer_items_path(@item.brewer_id)
    add_breadcrumb '日本酒の詳細'
    @review = Review.new
    @brewer = Brewer.all
    @review = @item.reviews
    @review = Review.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def edit
    add_breadcrumb '日本酒のデータベース', brewer_items_path(@item.brewer_id)
    add_breadcrumb '日本酒の詳細', item_path
    add_breadcrumb '日本酒情報の編集'
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
    redirect_to root_path if current_user.id != @item.user_id
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
