class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(:uid => auth_hash['uid']) do |user|
      user.name = auth_hash['info']['name']
    end
    session[:user_id] = user.try(:id)
    redirect_to '/'
  end



  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
