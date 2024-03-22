class CoinsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "coins_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
