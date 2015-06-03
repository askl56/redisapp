class AnotherEmail < ApplicationMailer

  default from: 'from@example.com'

  def default_email(recipients)
    mail(to: recipients, subject: "goodbye!")
  end
end
