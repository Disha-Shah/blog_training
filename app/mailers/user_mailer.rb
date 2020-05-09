class UserMailer < ActionMailer::Base

  def post_published(user_email, post_title)
    mail(to: user_email,
         body: "Your post - #{post_title} is published.",
         subject: 'Congratulations!',
         from: Rails.application.secrets.from_email)
  end

end
