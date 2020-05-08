class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_filter :log_object

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def log_object
    puts '*************************'
    puts request
    yield
    puts response
    puts '*************************'
  end
end
