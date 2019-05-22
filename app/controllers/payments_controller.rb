class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    # total_bike = 0
    # count_bikes = 0
    # @booking.bike.owner.bikes.each do |bike|
    #   rating(bike)

    # end
  end

  def create
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
    @payment.booking = @booking
    authorize @booking
    if @payment.save
      redirect_to user_path(@booking.rider)
    else
      render :new
    end
  end
end
