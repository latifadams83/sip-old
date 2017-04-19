class UserMailer < ApplicationMailer
  default from: "latiftanga@gmail.com"

  def welcome_msg(user, password)
    @user = user
    @greeting = "Welcome to Amass Students Information System"
    @url = "sip.uniqueamass.wa.com"
    mail to: @user.email, subject: "Login In Details"
    @password = password
  end
end
