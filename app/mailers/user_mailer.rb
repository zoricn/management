class UserMailer < ActionMailer::Base
  #Usage:  UserMailer.invitation_confirmation(user).deliver
  default :from => "\"Example.net\" <dev@example.com>"

  def invitation_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def welcome(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

end
