class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Coordinator
      coordinator_path(current_coordinator.id)
    when Resident
      
    end
  end

  # def after_sign_out_path_for(resource)
  #   new_coordinator_session_path # ログアウト後に遷移するpathを設定
  # end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :sex, :birthday, :occupation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_name, :sex, :birthday, :occupation])
    end
end
