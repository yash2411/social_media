module ApplicationHelper
    def current_path?(path)
        current_page?(path) ? 'active' : ''
    end

    def file_path(file)
        Rails.application.routes.url_helpers.rails_blob_path(file, only_path: true)
    end
end
