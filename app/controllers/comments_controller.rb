# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
  before_action :set_blog_post

  def new
    @comment = Comment.new(blog_post: @blog_post)
  end

  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.new(comment_params)
    @comment.user = current_user if user_signed_in?
    if @comment.save
      redirect_to root_path, notice: 'Комментарий успешно создан.'
    else
      render 'new'
    end
  end

  def index
    @comments = @blog_post.comments
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
