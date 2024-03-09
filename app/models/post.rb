class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :medias, dependent: :destroy
  has_many :likes, as: :likeable
end
