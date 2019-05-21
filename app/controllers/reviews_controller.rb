class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  def show
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review
    if @review.save
      redirect_to @review
    else
      format.html { render :new }
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      format.html { render :edit }
    end
  end

  def destroy
    @review.destroy
    redirect_to booking_url
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:description, :stars, :created_at)
  end
end
