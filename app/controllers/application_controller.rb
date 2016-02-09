class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  protected

    def logged_in?
      if current_user
        return true
      else
        flash[:danger] = 'You are not logged in!'
        redirect_to login_path
      end
    end
end
