class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path(current_user.id)
  end


  def index
    @posts = current_user.posts.all
    @post = Post.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def show
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @post = Post.find(params[:id])
    @post_form = Post.new
    @post_comment = PostComment.new
    # @posts = Post.where(user_id: [current_user.id, *current_user.following_ids])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:body, :posts_image)
  end

end
