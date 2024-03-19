class MessagesController < ApplicationController
  before_action :update_last_seen_at

  def index
    @user = User.find(params[:id])
    session[:user_id] = current_user.id
    @message = Message.new
    @messages = messages = Message.where(sender: current_user, receiver: @user).or(Message.where(sender: @user, receiver: current_user)).order(created_at: :asc)
  end

  def create
    sender = current_user
    @message = sender.sender_messages.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id)
  end

end
