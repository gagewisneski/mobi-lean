class UsersController < ApplicationController
  before_action :signed_in?, only: [:new, :ceate]

  def index
    # home page explaining the program and getting users to sign up
    @programs = Program.all.order(:id)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password].length > 7
      if @user.save
        # @user.send_activation_email
        # flash[:success] = 'Please check your email to activate your account.'
        session[:user_id] = @user.id
        flash[:success] = 'You have successfully signed up!'
        redirect_to '/'
      else
        # flash[:warning] = @user.errors.full_messages.join(', ')
        flash[:warning] = 'Your email is already in use or invalid'
        render :new
      end
    else
      flash[:warning] = 'Your password needs to be at least 8 characters'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
