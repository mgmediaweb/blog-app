class Api::PostsController < ApplicationController
  # load_and_authorize_resource

  # before_action :authorize_request

  def index
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end
end
