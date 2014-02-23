class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_url, :notice => "You are now logged in"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def session_params
    params.require(:sessions).permit(:email, :password, :password_confirmation)
  end

end
