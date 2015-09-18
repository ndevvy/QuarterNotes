class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_band_id

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def must_be_logged_in
    unless logged_in?
      flash[:messages] = ["Please log in to continue"]
      redirect_to new_session_url 
    end
  end

  def login_user!(user)
    token = user.reset_session_token!
    session[:session_token] = token
  end

  def current_band_id
    params[:band_id]
  end

end
