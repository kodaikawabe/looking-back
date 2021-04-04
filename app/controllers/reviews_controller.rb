class ReviewsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
  end

  def new
    @review = Review.new
  end

  def create
    @room = Room.find(params[:room_id])
    @review = @room.reviews.new(review_params)
    if @review.save
      redirect_to room_reviews_path(@room)
    else
      @reviews = @room.reviews.includes(:user)
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :group, :proceeds, :comment, :image).merge(user_id: current_user.id)
  end

end
