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
    @bike = @review.booking.bike
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to bike_path(@bike) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bikes/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
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
