# app/controllers/profiles_controller.rb

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:show, :edit]

  def show
    @user_posts = @user.blog_posts if @user.respond_to?(:blog_posts)
    @posts_count = @user_posts&.count || 0
  end

  def edit
  end

  def authorize_user
    redirect_to root_path unless current_user == @user
  end
  def update
    if @user.update(user_params)
      # Проверяем, было ли прикреплено изображение
      @user.avatar.attach(params[:avatar]) if params[:avatar].present?
      redirect_to profile_path, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
