class ProgramsController < ApplicationController
  before_action :admin?

  def index
    @programs = Program.all
  end

  def new
  end

  def create
    program = Program.new(start_date: params[:start_date], end_date: params[:end_date], active: false)
    if program.save
      redirect_to '/'
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
    program.update_attributes(start_date: params[:start_date], end_date: params[:end_date], active: params[:active])
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
    redirect_to '/programs'
    flash[:success] = 'Program Deleted'
  end
end
