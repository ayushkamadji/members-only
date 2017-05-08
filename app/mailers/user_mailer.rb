class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = sign_in_url
    mail(to: @user.email, subject: "Welcome to Members Only")
  end
end
