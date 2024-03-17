class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :username, presence: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sender_messages, class_name: "Message", dependent: :destroy, foreign_key: :sender_id
  has_many :receiver_messages, class_name: "Message", dependent: :destroy, foreign_key: :receiver_id

  has_one_attached :photo

  acts_as_followable
  acts_as_follower

  before_save { self.username = self.username.downcase }

  def followers_count
    self.followers(User).count
  end

  def following_count
    self.followees(User).count
  end

end
