class FollowsController < ApplicationController
    before_action :fetch_user, only: :toggle_follow

    def toggle_follow
        @search = params[:search]
        current_user.toggle_follow!(@user)
        respond_to do |format|
            format.turbo_stream { }
        end
    end

    def friends_list
        @users = current_user.followees(User)
        render 'search_user'
    end

    def search_user
        @users = User.where("username LIKE ?", "%#{params[:user][:username].downcase}%")
    end

    private

    def fetch_user
        @user = User.find_by_id(params[:id])
    end
end
