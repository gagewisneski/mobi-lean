class UsersController < ApplicationController
  def index
    # home page explaining the program and getting users to sign up
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if params[:email] == params[:email_again]
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = 'You have successfully signed up!'
        redirect_to '/'
      else
        # flash[:warning] = @user.errors.full_messages.join(', ')
        flash[:warning] = 'Something went wrong'
        render :new
      end
    else
      flash[:warning] = 'You entered two different emails'
      render :new
    end
  end
end
