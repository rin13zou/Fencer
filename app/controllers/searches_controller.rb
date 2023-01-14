class SearchesController < ApplicationController

  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:word]).where(is_deleted: false)
    else
      @posts = Post.looks(params[:word])
    end
  end

end
