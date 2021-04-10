class ReviewsController < ApplicationController
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
    if @review.save
      redirect_to item_path(@item)
    end
  end
  
  def show

    @review = Review.find(params[:id])
    @user= User.find(@review.user_id)
    @item= Item.find(@review.item_id)
  end

  def edit
    # binding.pry
    # @item = Item.find(params[:item_id])
    # add_breadcrumb '日本酒の詳細', item_path
    add_breadcrumb 'レビューの編集'
    @review = Review.find(params[:id])
    # @reviews = @itme.reviews
    if current_user.id != @review.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_path(@review.item_id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id != @review.user_id
    redirect_to root_path
    end
    if @review.destroy 
    redirect_to item_path(@review.item_id)
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content,:title).merge(user_id: current_user.id)
  end

end
