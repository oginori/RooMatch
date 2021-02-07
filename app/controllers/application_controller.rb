class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Coordinator
      coordinator_path(current_coordinator.id)
    when Resident
      interiors_path
    end
  end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Coordinator
  #     new_coordinator_session_path
  #   when Resident
  #     new_resident_session_path
  #   end
  # end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :sex, :birthday, :occupation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_name, :sex, :birthday, :occupation])
    end
end
