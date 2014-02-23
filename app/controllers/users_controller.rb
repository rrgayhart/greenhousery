class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      #flash[:alert] = "Something went wrong!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    gon.latitude = @user.latitude
    gon.longitude = @user.longitude
  end

  private

  def user_params
    params.require(:user).permit(:email, :street, :city, :state, :country, :password, :password_confirmation)
  end

end
