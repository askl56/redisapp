require 'message'

class MessageWorker
  include Sidekiq::Worker

  def perform(user, body, url)
    Message.new(user, body, url).send
  end
end
