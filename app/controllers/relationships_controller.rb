class RelationshipsController < ApplicationController
  #before_action :set_user, only: [:followings, :followers]

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
