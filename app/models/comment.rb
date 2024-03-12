class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id
  belongs_to :comment, class_name: 'Comment', optional: true
  scope :fetch_post_comments, -> { where(parent_id: nil)}
end
