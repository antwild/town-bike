class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @bikes = @user.bikes.all
    authorize @user
  end
end
