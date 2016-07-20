class UserMailer < ApplicationMailer
  default from: 'notifications@crowdcode.com'

  def welcome_email(user, feature)
    @user = user
    @feature = feature
    mail(to: @user.email, subject: 'Welcome to CrowdCode')
  end
end
