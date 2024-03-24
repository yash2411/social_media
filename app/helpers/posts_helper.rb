module PostsHelper
    def is_video?(content_type)
        ["mp4", "mov", "mkv", "webm"].any? { |ext| content_type.include?(ext) }
    end
end
