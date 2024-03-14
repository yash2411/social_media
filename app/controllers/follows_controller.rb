class FollowsController < ApplicationController
    def create

    end

    def search_user
        @users = User.where("username LIKE ?", "%#{params[:user][:username].downcase}%")
    end
end
