class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login_user!(@user)
      flash[:messages] = ["Logged in successfully"]
      redirect_to bands_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
