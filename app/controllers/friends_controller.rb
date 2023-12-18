class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
    @users = User.where.not(id: current_user.id)
  end

  def create
    friend = User.find(params[:friend_id])

    # Добавить друга в список друзей текущего пользователя
    current_user.friends << friend unless current_user.friends.include?(friend)

    # Добавить текущего пользователя в список друзей друга
    friend.friends << current_user unless friend.friends.include?(current_user)

    redirect_to friends_path
  end


  def destroy
    friend = User.find(params[:id])
    current_user.friends.destroy(friend) if current_user.friends.include?(friend)
    redirect_to friends_path
  end
end
