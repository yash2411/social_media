class ProfilesController < ApplicationController
    before_action :update_last_seen_at

    def show
        @user = User.find_by_id(params[:id])
        @followers = NumericalNotation.to_short_notation(@user.followers_count)
        @following = NumericalNotation.to_short_notation(@user.following_count)
    end
end
