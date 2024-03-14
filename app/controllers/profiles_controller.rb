class ProfilesController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        @followers = @user.followers_count
        @following = @user.following_count
    end
end
