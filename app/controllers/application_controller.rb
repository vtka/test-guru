class ApplicationController < ActionController::Base

  # include SessionsHelper

  # protect_from_forgery with: :exception

  # helper_method :current_user,
  #               :logged_in?

  # private

  # def authenticate_user!
  #   cookies[:requested_url] = request.original_url
  #   unless current_user
  #     redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please!'
  #   end

  #   cookies[:email] = current_user&.email
  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   current_user.present?
  # end
end
