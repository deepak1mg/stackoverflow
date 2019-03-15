class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following looku	p:
  #
  #   en.user_mailer.reset_password.subject
  #
  def reset_password(user)
  	@user = user
  	mail to: user.email, subject: 'Password reset'
  end
end
