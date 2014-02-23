class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    gon.latitude = @user.latitude
    gon.longitude = @user.longitude
  end

  private

  def user_params
    params.require(:user).permit(:email, :street, :city, :state, :country, :password)
  end

end
