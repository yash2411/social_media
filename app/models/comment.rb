class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, class_name: 'Comment', foreign_key: :parent_id
  belongs_to :replies, class_name: 'Comment', optional: true
end
