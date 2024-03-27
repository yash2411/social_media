class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :medias
  has_many :likes, as: :likeable
  has_many :comments

  def video_attachments
    medias.select do |media|
      video_content_types.include?(media.content_type) || video_file_extensions.include?(File.extname(media.filename.to_s).downcase)
    end
  end

  private

  def video_content_types
    ['video/mp4', 'video/mpeg', 'video/quicktime', 'video/x-msvideo', 'video/x-flv', 'video/webm', 'video/x-matroska', 'video/3gpp', 'video/3gpp2', 'video/ogg', 'video/x-ms-wmv']
    # Add more video content types if needed
  end

  def video_file_extensions
    ['.mp4', '.mov', '.avi', '.flv', '.webm', '.mkv', '.3gp', '.3g2', '.ogv', '.wmv']
    # Add more video file extensions if needed
  end
end
