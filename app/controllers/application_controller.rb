class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # JR - add first_name, last_name at signup
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :about_me, :photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:about_me])
  end
  # Pundit methods
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

    def rating(param)
    reviews = param.reviews
    sum = 0
    reviews.each do |r|
      sum += r.stars
    end
    if reviews.count.positive?
      @raw_rating = sum.to_f / reviews.count
      @full_stars = @raw_rating.floor
      @half_stars = ((((@raw_rating * 2).round.to_f / 2) - @full_stars) * 2).to_i
      @emtpy_stars = 5 - @full_stars - @half_stars
      @rating = { full_stars: @full_stars, half_stars: @half_stars, empty_stars: @emtpy_stars }
    else
      @rating = { full_stars: 0, half_stars: 0, empty_stars: 0 }
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
