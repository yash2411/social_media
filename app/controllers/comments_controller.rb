class CommentsController < ApplicationController
  before_action :fetch_post
  before_action :update_last_seen_at

  
  def turbo_frame_comment
  end

  def new
    render :turbo_frame_comment
  end

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    @comments = @post.comments.order(created_at: :desc)
    if @comment.save
      respond_to do |format|
        format.turbo_stream {  }
      end
    end
  end

  def add_reply
    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    if @comment.save
      render turbo_stream: turbo_stream.replace(@post)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :parent_id, :post_id)
  end

  def fetch_post
    @post = Post.find_by(id: params[:post_id])
  end
end
