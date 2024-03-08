module ApplicationHelper
    def current_path?(path)
        current_page?(path) ? 'active' : ''
    end
end
