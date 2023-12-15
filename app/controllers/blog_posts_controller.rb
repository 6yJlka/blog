# app/controllers/blog_posts_controller.rb

class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:destroy, :edit, :update]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = current_user if user_signed_in?

    if @blog_post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :image)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def authorize_user
    # Проверка, что текущий пользователь имеет право удалять этот пост
    unless current_user == @blog_post.user
      redirect_to root_path, alert: 'You are not authorized to delete or edit this post.'
    end
  end

end
