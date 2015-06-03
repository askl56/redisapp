class SendEmail < ApplicationMailer
  default from: 'from@example.com'

  def default_email(recipients)
    mail(to: recipients, subject: "hi!")
  end
end
