class ProgramsController < ApplicationController
  before_action :admin?

  def index
    @programs = Program.all.order(:id)
  end

  def new
  end

  def create
    program = Program.new(start_date: params[:start_date], end_date: params[:end_date], active: false, password_digest: params[:password])
    if program.save
      redirect_to '/programs'
      flash[:success] = 'Saved program'
    else
      redirect_to '/programs/new'
      flash[:danger] = 'Program did not save'
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    program = Program.find(params[:id])
    program.update_attributes(start_date: params[:start_date], end_date: params[:end_date], active: params[:active], password_digest: params[:password])
    if program.save
      redirect_to '/programs'
      flash[:success] = 'Edited program'
    else
      redirect_to "/programs/#{program.id}/edit"
      flash[:danger] = 'Program did not save'
    end
  end

  def destroy
    program = Program.find(params[:id])
    program.destroy
    users_programs = UsersProgram.where(program_id: params[:id])
    users_programs.each do |user_p|
      user_p.destroy
    end
    redirect_to '/programs'
    flash[:success] = 'Program Deleted'
  end
end
