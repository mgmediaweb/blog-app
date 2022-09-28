class UsersController < ApplicationController
  def index
    @title = 'List of users'
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @title = "Detail of #{@user.name}"
  end
end
