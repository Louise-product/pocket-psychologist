class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.completed
      return new_problem_path
    else
      return edit_user_registration_path
    end
  end

  def user_root_path
    new_problem_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:age, :gender, :context])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :gender, :context])
  end
end
