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
    unless current_user.id == 1
      redirect_to '/'
      flash[:danger] = "You aren't an admin!"
    end
  end

  def active_program?
    if current_user.programs
      programs = current_user.programs
      active = 0
      programs.each do |program|
        if program.active
          active += 1
        end
      end
      if active.zero?
        redirect_to '/'
        flash[:warning] = "Your program isn't active"
      end
    elsif current_user
      redirect_to '/'
      flash[:warning] = 'You need to sign up for a program'
    end
  end
end
