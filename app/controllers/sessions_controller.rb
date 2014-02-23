class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to user, :notice => "You are now logged in"
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
    params.require(:sessions).permit(:email, :password, :password_confirmation, :remember_me_token, :remember_me_token_expires_at)
  end

end
