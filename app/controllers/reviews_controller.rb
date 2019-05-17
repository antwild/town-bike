class ReviewsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bike = Bike.find(params[:bike_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:description, :stars, :bike_id, :rider_id)
  end
end
