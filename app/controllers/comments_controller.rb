class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post])
    # @comment = Comment.new(post: @post, author: current_user, text: nil)
    @comment = Comment.new
    @title = 'Create Comment'
    # p "==> #{@comment.post}"
  end

  def create
    @post = Post.find(params[:post])
    @comment = Comment.create(post: @post, author: current_user, text: params[:text])
    # p "--> #{@comment.author}"
    # p "--> #{@comment.post}"
    # p "--> #{@comment.text}"

    redirect_to user_post_path(current_user,@post.id) if @comment.save
  end

  private

  def strong_params
    # params.require(:comment).permit(:post, :author, :text)
    params.require(:comment).permit(:post, :text)
  end
end
