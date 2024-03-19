class ProfilesController < ApplicationController
    before_action :update_last_seen_at

    def show
        @user = User.find_by_id(params[:id])
        @followers = @user.followers_count
        @following = @user.following_count
    end
end
