class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @title = 'Create Comment'
  end

  def create
    @post = Post.find(params[:post])
    @comment = Comment.new(post: @post, author: current_user, text: params[:text])
    redirect_to user_post_path(current_user, @post.id) if @comment.save
  end

  private

  def strong_params
    params.require(:comment).permit(:post, :text)
  end
end
