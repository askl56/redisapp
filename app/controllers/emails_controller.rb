class EmailsController < ApplicationController
  def index
  end

  def standard
    SendEmail.default_email(recipients).deliver
    AnotherMail.default_email(recipients).deliver

    redirect_to emails_path, notice: "Sent email (standard)"
  end

  def delayed
    SendEmailWorker.perform_async("SendEmail", recipients)
    SendEmailWorker.perform_async("AnotherEmail", recipients)

    redirect_to emails_path, notice: "Sent email (standard)"
  end

  private

  def recipients
    [ "amscott@openmailbox.org, blah@blah.com" ]
  end
end
