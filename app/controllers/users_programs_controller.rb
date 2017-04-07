class UsersProgramsController < ApplicationController
  before_action :authenticate_user!

  def new
    @program = Program.find(params[:id])
  end

  def create
    @program = Program.find(params[:program_id])
    if params[:password] == @program.password_digest
      users_program = UsersProgram.new(user_id: current_user.id, program_id: params[:program_id])
      if users_program.save
        flash[:success] = 'You have signed up for this program'
        count = 1
        20.times do
          Diet.create(day: count, user_id: @user.id, hawaiian_nut_fast: false, hour_fast_18: false, cheat_meal: false, program_id: params[:program_id])
          count += 1
        end
      else
        flash[:warning] = 'Something went wrong'
      end
    else
      flash[:warning] = 'Wrong password'
    end
    redirect_to '/'
  end
end
