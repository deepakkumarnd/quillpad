class CommentChannel < ApplicationCable::Channel
  def subscribed
    puts "#{self.class} subscribed"
    Rails.logger.info "Params got for CommentChannel"
    Rails.logger.info params
    stream_from params[:room]
  end

  def unsubscribed
    puts "#{self.class} unsubscribed"
    # Any cleanup needed when channel is unsubscribed
  end
end
