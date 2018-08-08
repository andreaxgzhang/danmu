class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "slide_#{params[:slide_id]}_comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
