class RateChannel < ApplicationCable::Channel
  def change(data)
    stream_from "rate_channel"
  end
end
