class UsersController < ApplicationController
  def index
    @title = 'List of users'
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @title = "Detail of #{@user.name}"
  end
end
