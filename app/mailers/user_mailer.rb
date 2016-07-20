class UserMailer < ApplicationMailer
  default from: 'notifications@crowdcode.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CrowdCode')
  end
end
