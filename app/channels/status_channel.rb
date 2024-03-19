class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_status_stream"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def user_status
  end
end
