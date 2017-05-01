class BlogsController < ApplicationController
  before_action :admin?, except: [:index, :show]
  before_action :authenticate_user!, only: [:index, :show]
  before_action :active_program?, only: [:index, :show]

  def index
    @blogs = Blog.all.order(:id)
    @count = 0
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(title: params[:title], text: params[:text])
    if @blog.save
      redirect_to '/blogs'
      flash[:success] = 'Saved blog'
    else
      redirect_to '/blogs/new'
      flash[:danger] = 'Blog did not save'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(title: params[:title], text: params[:text])
    if @blog.save
      redirect_to '/blogs'
      flash[:success] = 'Edited blog'
    else
      redirect_to "/blogs/#{@blog.id}/edit"
      flash[:danger] = 'Blog did not save'
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to '/blogs'
    flash[:success] = 'Blog Deleted'
  end
end
