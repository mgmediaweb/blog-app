class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @posts = Post.find_by(author: @user)
    @posts = Post.all
    @title = "Post of #{@user.name}"
  end

  def show
    @post = Post.find(params[:post_id])
    @title = "Detail of #{@post.title}"
  end
end
