class Api::CommentsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # load_and_authorize_resource

  def index
    p "--> #{params[:post_id]}"
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    @comment.user_id = current_user.id

    if @comment.save
      render json: { message: 'Succesfully created', comment: @comment }, status: :created
    else
      render json: { message: @comment.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
