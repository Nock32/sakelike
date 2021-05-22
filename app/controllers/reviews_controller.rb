class ReviewsController < ApplicationController
  before_action :set_review_id, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'トップページ', :root_path

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new(review_params)
    render json:{ post: @review }
    @review.save
  end

  def show
    @user = User.find(@review.user_id)
    @item = Item.find(@review.item_id)
  end

  def edit
    add_breadcrumb '日本酒の詳細', item_path(@review.item_id)
    add_breadcrumb 'レビューの編集'
    if current_user.id != @review.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @review.update(review_params)
      redirect_to item_path(@review.item_id)
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to item_path(@review.item_id)
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :title).merge(user_id: current_user.id)
  end

  def set_review_id
    @review = Review.find(params[:id])
  end
end
