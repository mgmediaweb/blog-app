class Api::PostsController < ApplicationController
  # load_and_authorize_resource

  def index
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end
end
