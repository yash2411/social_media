class MessagesController < ApplicationController
  def index
    @user = User.find(params[:id])
    session[:user_id] = current_user.id
    @message = Message.new
    @messages = Message.all
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
