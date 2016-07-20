class SessionsController < ApplicationController
  def create
    user = User.find_by(uid: auth['uid'])
=begin
    if !user
      user = User.create(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex if u.password.nil?
      end
    end
=end
#    session[:user_id] = user.id
  end

  def auth
    request.env['omniauth.auth']
  end
end
