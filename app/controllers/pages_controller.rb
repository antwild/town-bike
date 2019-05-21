class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
    @bikes = policy_scope(Bike).order(created_at: :desc)
      @bike_locs = Bike.where.not(latitude: nil, longitude: nil)
      @markers = @bike_locs.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { bike: bike })
        }
      end
      @bikes.each { |bike| rating(bike) }
  end
end
