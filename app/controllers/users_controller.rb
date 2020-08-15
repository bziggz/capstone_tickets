class UsersController < ApplicationController
  before_action :logged_in_user, except: %i[index show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Registration Successful'
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
