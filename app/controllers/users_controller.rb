class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
