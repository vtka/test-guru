class ApplicationController < ActionController::Base

  # When you customize your own views, you may end up adding new attributes to forms. 
  # Rails 4 moved the parameter sanitization from the model to the controller, causing 
  # Devise to handle this concern at the controller as well.

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
