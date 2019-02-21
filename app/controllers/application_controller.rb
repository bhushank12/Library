class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(user)
    libraries_path
  end

  protected
  def configure_permitted_parameters
    attributes = [:name, :email, :password, :library_id, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: attributes
  end
end
