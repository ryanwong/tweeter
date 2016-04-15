class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def index
    @text = "Users"
    @users = User.search(params[:search]).order(created_at: :desc).page(params[:page])
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email], user_params[:password])
      redirect_to root_path
      flash[:success] = "user was created!"
    else
      flash[:error] = @user.errors.messages.map{|e| "<i class='fa fa-minus'></i> <strong>#{e.flatten.first.to_s.titleize}</strong> #{e.flatten.last}"}.push("YA DUN FUCKED UP NOW A-A-RON").join('<br />')
      redirect_to new_user_path(@user)
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation) if params[:user]
  end

end
