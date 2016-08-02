# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GamesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "games:#{data['game_id']}"
  end

  def unfollow
    stop_all_streams
  end

  def update(data)
    UpdateAndBroadcastGameJob.perform_later(data)
  end
end
