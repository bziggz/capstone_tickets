include SessionHelper

class ApplicationController < ActionController::Base
  include SessionHelper

  protect_from_forgery with: :exception

  helper_method :current_user?, :logged_in?

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Log In'
      redirect_to login_url
    end
  end
end
