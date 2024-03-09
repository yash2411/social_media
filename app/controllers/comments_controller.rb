class CommentsController < ApplicationController
  before_action :fetch_post

  def index
  end

  def new
  end

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    if @comment.save
        render turbo_stream: turbo_stream.replace(@post)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

  def fetch_post
    @post = Post.find_by(id: params[:comment][:post_id])
  end
end
