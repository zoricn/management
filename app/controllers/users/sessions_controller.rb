class Users::SessionsController < Devise::SessionsController

  #Dummy override Devise Session Controller
  def create
    super
  end

end

