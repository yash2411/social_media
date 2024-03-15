class LikesController < ApplicationController
    before_action :fetch_post

    def create
        @like = Like.find_or_initialize_by(likeable: fetch_post, user: current_user)
        if @like.save
            respond_to do |format|
                format.turbo_stream {  }
              end
        end
    end

    def destroy
        @like = current_user.likes.find_by(likeable: @post)
        if @like.destroy
            respond_to do |format|
                format.turbo_stream {  }
              end
        end
    end

    private

    def fetch_post
        @post = Post.find_by(id: params[:post_id])
    end
end
