class LikesController < ApplicationController
  def create
    @post_id = params[:post]
    @like = current_user.likes.new(post_id: @post_id)
    redirect_to user_post_path(current_user, @post_id) if @like.save
  end
end
