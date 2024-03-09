class LikesController < ApplicationController
    before_action :fetch_post

    def create
        @like = Like.find_or_initialize_by(likeable: fetch_post, user: current_user)
        if @like.save
            @posts = Post.all
            render turbo_stream: turbo_stream.replace(@post)
        end
    end

    def destroy
        @like = current_user.likes.find_by(likeable: @post)
        if @like.destroy
            @posts = Post.all
            render turbo_stream: turbo_stream.replace(@post)
        end
    end

    private

    def like_params
        params.require
    end

    def fetch_post
        @post = Post.find_by(id: params[:id])
    end
end
