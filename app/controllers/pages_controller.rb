class PagesController < ApplicationController
  def index
    @followed_users_id = current_user.followees(User).includes(:posts).pluck(:id)
    @followed_users_id << current_user.id
    @posts = Post.where(user_id: @followed_users_id).order(created_at: :desc)    
  end
end
