class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check, only: [:edit, :update, :withdrawal]

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def index
    @user = current_user
    @post = Post.new
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @users = User.where(admin: false).where(is_deleted: false)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path, notice: "ユーザー情報更新しました"
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
    @user = User.find(params[:id])
    @post = Post.new
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    user = User.find(params[:id])
    @users = user.following_user
  end

  def followers
    @user = User.find(params[:id])
    @post = Post.new
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    user = User.find(params[:id])
    @users = user.follower_user
  end


  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert: "退会処理しました"
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :user_name)
  end

  def guest_check
    if current_user.email == 'guest@sample.com'
      redirect_to root_path, notice: 'ゲストユーザーの場合この操作はできません。'
    end
  end

end
