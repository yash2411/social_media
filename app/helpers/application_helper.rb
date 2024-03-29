module ApplicationHelper
    def current_path?(path)
        current_page?(path) ? 'active' : ''
    end

    def file_path(file)
        Rails.application.routes.url_helpers.rails_blob_path(file, only_path: true) if file.present?
    end

    def current_user_post_like?(post)
        like = Like.where(user: current_user, likeable: post).first
        like ? true : false
    end

    def get_current_user
        session[:user_id]
    end
end
