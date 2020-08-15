class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password_digest])
      log_in user
      redirect_to projects_path
    else
      flash.now[:danger] = 'Invalid Username or Password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
