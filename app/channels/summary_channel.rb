# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SummaryChannel < ApplicationCable::Channel
  def subscribed
    stream_from "summary"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
