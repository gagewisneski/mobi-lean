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
    if @user.save
      @user.send_activation_email
      flash[:success] = 'Please check your email to activate your account.'
      redirect_to '/'
    else
      # flash[:warning] = @user.errors.full_messages.join(', ')
      flash[:warning] = 'Something went wrong'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
