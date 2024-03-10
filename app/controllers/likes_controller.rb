class LikesController < ApplicationController
    before_action :fetch_post

    def create
        @like = Like.find_or_initialize_by(likeable: fetch_post, user: current_user)
        if @like.save
            render turbo_stream: turbo_stream.replace(@post)
        end
    end

    def destroy
        @like = current_user.likes.find_by(likeable: @post)
        if @like.destroy
            render turbo_stream: turbo_stream.replace(@post)
        end
    end

    private

    def fetch_post
        @post = Post.find_by(id: params[:id])
    end
end
