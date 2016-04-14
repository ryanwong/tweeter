class UsersController < ApplicationController

  def index
    @text = "Users"
    @users = User.search(params[:search]).order(created_at: :desc).page(params[:page])

end
