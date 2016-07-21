class UserMailer < ApplicationMailer
  default from: 'notifications@crowdcode.com'

  def confirmation_email(user, feature)
    @user = user
    @feature = feature
    mail(to: @user.email, subject: 'Congratulations from CrowdCode')
  end
end
