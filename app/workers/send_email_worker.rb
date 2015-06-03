class SendEmailWorker
  include Sidekiq::Worker

  def perform klass, recipients
    self.class.const_get(klass).
      default_email(recipients).
      deliver
  end
end
