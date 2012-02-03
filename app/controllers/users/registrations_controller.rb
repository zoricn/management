class Users::RegistrationsController < Devise::RegistrationsController
 
  #Dummy override Devise Session Controller
  def create
    super
    UserMailer.welcome(current_user).deliver unless current_user.nil?
  end

end

