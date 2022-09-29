class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @author = User.find(params[:id])
    @post = @author.post
    @title = 'Create Comment'
  end

  def create
    @post = Post.find(params[:post])
    @comment = Comment.new(post: @post, author: current_user, text: params[:text])

    respond_to do |format|
      format.html do
        redirect_to user_post_path(current_user, @post.id) if @comment.save
      end
      format.json do
        render json: @comment
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post_id
    Comment.destroy(params[:id])
    redirect_to user_post_path(current_user, post)
  end

  private

  def strong_params
    params.require(:comment).permit(:post, :text)
  end
end
