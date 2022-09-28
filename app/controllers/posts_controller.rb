class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author)
    @title = "Post of #{@user.name}"
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @title = "Detail of #{@post.title}"
  end

  def new
    @post = Post.new
    @title = 'Create post'
  end

  def create
    @post = current_user.posts.new(strong_params)
    redirect_to user_path(current_user) if @post.save
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_path(current_user)
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
