class UsersController < ApplicationController

  def index
    @text = "Users"
    @users = User.search(params[:search]).order(created_at: :desc)
  end

end
