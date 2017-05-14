class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :active_program?, if: :admin?, except: :edit

  def index
    # here is the information on the diet
  end

  def core
  end

  def moderation
  end

  def options
  end

  def cheat
  end

  def plans
  end

  def mobi_meals
  end

  def new
  end

  def create
    # @diet = Diet.new(user_id: current_user.id,
    #                  date: Time.now,
    #                  weight: params['weight'],
    #                  moderation1: params['mod1'],
    #                  moderation2: params['mod2'],
    #                  moderation3: params['mod3'],
    #                  option1: params['opt1'],
    #                  option2: params['opt2'],
    #                  water1: params['wat1'],
    #                  water2: params['wat2'],
    #                  water3: params['wat3'],
    #                  water4: params['wat4'])
  end

  def show
    # charts to show your improvement and your food intke?
  end

  def edit
    @user = User.find(current_user.id)
    programs = @user.programs.where(active: true).order(:id)
    @program = Program.find(params[:id])
    @diets = Diet.where(user_id: @user.id, program_id: params[:id]).order(:day)
    program_index = programs.index(@program)
    unless programs[program_index] == programs[-1]
      @next = programs[program_index + 1]
    end
    unless programs[program_index] == programs[0]
      @previous = programs[program_index - 1]
    end
  end

  def update
    @diet = Diet.find(params[:id])
    @diet.assign_attributes(weight: params[:weight], nuts_and_seeds: params[:nuts_and_seeds], greek_yogurt: params[:greek_yogurt], cheese: params[:cheese], almond_butter: params[:almond_butter], zoodles: params[:zoodles], spaghetti_squash: params[:spaghetti_squash], hummus_and_guac: params[:hummus_and_guac], cottage_cheese: params[:cottage_cheese], fruit: params[:fruit], happy: params[:happy], bean: params[:bean], chocolate_bar: params[:chocolate_bar], hawaiian_nut_fast: params[:hawaiian_nut_fast], hour_fast_18: params[:hour_fast_18], cheat_meal: params[:cheat_meal])
    @diet.save
    redirect_to '/diets/edit'
  end
end
