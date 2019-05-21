class UsersController < ApplicationController
   def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
    else
      format.html { render :edit }
    end
  end

  def destroy
    @user.destroy
  end
end
