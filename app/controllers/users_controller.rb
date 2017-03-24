class UsersController < ApplicationController
  def index
    # home page explaining the program and getting users to sign up
    @programs = Program.all.order(:id)
  end

  def show
  end

  def new
    @user = User.new
    @programs = Program.all
  end

  def create
    # program = params[:program][:id]
    if params[:email] == params[:email_again]
      @user = User.new(user_params)
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :program_id)
  end
end
