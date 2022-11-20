class RelationshipsController < ApplicationController
  
  def create
    current.user.follow(params[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    current.user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def folliwer
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end
