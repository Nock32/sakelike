class BrewersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'トップページ', :root_path

  def index
    @brewers = Brewer.all.order('created_at DESC')
    @brewers.includes(:brewer)
    @q = Brewer.ransack(params[:q])
    @brewer = @q.result(distinct: true).order(created_at: :desc)
    # @brewers = Brewer.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def new
    @brewer = Brewer.new
    add_breadcrumb '酒蔵のデータベース', root_path
    add_breadcrumb '酒蔵の登録'
  end

  def show
    add_breadcrumb '酒蔵の詳細'
    @brewer = Brewer.find(params[:id])
    @item = @brewer.items
    @item.includes(:item)
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
    add_breadcrumb '酒蔵の詳細', brewer_path, only: [:show]
    add_breadcrumb '酒蔵情報の編集'
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
    redirect_to root_path if current_user.id != @brewer.user_id

    if @brewer.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def brewer_params
    params.require(:brewer).permit(:name, :explanation, :address, :area_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @brewer = Brewer.find(params[:id])
  end
end
