class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:warning] = 'You need to be logged in to do this'
      redirect_to '/login'
    end
  end

  def signed_in?
    if current_user
      flash[:warning] = 'You are already signed in!'
      redirect_to '/'
    end
  end

  def admin?
    unless current_user.email == 'gagewisneski@gmail.com'
      redirect_to '/'
      flash[:danger] = "You aren't an admin!"
    end
  end
end
