class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :medias
  has_many :likes, as: :likeable
  has_many :comments
end
