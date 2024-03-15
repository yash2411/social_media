class PagesController < ApplicationController
  def index
    @followed_users = current_user.followees(User).includes(:posts)
    @posts = Post.where(user_id: @followed_users.pluck(:id))    
  end
end
