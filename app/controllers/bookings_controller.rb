class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @bike_id = params[:bike_id]
    @booking = Booking.new
    authorize @booking
    # raise
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.rider = current_user
    @booking.bike_id = params[:bike_id]
    @booking.total = @booking.calculate_total
    authorize @booking
    if @booking.save
      redirect_to new_booking_payment_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
