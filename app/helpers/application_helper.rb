module ApplicationHelper
    def logged_in?
        current_coordinator.present? || current_resident.present?
    end

    def login_judgement
        redirect_to tops_path, notice: 'ログインしてください。' unless logged_in?
    end
end
