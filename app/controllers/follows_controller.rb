class FollowsController < ApplicationController
    before_action :fetch_user, only: :toggle_follow
    before_action :update_last_seen_at
    before_action :suggested_users, except: [:toggle_follow, :search_user]

    def toggle_follow
        @search = params[:search]
        current_user.toggle_follow!(@user)
        respond_to do |format|
            format.turbo_stream { }
        end
    end

    def followees_list
        @users = current_user.followers(User)
        if @users.empty?
            flash.now[:notice] = "No friends yet!"
            render 'search_user'
        else
            render 'search_user'
        end
    end

    def followers_list
        @users = current_user.followees(User)
        if @users.empty?
            flash.now[:notice] = "No friends yet!"
            render 'search_user'
        else
            render 'search_user'
        end
    end

    def search_user
        @users = User.where("username LIKE ?", "%#{params[:user][:username].downcase}%")
    end

    private

    def fetch_user
        @user = User.find_by_id(params[:id])
    end

    def suggested_users
        followed_user_ids = current_user.followees(User).pluck(:id)
        suggested_friends_ids = Follow.where(follower_id: followed_user_ids)
                                    .pluck(:followable_id)
                                    .uniq 
        suggested_friends_ids -= followed_user_ids
        @suggested_friends = User.where(id: suggested_friends_ids)
        if @suggested_friends.empty?
            @suggested_friends = User.where.not(id: followed_user_ids << current_user.id)
        end
    end
end
