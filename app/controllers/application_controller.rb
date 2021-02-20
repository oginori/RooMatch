class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Coordinator
      coordinator_path(current_coordinator.id)
    when Resident
      resident_path(current_resident.id)
    end
  end

  def after_sign_out_path_for(resource)
    tops_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :sex, :birthday, :occupation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_name, :sex, :birthday, :occupation])
    end
end
