class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:description, medias: [])
  end

end
