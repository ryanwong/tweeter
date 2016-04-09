class UsersController < ApplicationController

  def index
    @text = "Users"
    @users = User.all.order(created_at: :desc)
  end

end
