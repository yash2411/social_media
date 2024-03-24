class PostsController < ApplicationController
  before_action :update_last_seen_at

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Your post has been published successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @post.increment!(:views)
    @comments = @post.comments.fetch_post_comments
  end

  def videos
    @videos = ActiveStorage::Blob.select do |file|
      ["mp4", "mov", "mkv", "webm"].any? { |ext| file.content_type.include?(ext) }
    end     
  end

  def turbo_frame_posts
  end

  def all_users_posts
    @user = User.find_by_id(params[:id])
    @posts = Post.where(user_id: @user.id)
    render :turbo_frame_posts
  end

  private

  def post_params
    params.require(:post).permit(:caption, medias: [])
  end

end
