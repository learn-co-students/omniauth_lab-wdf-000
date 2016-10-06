class SessionsController < ApplicationController
  def create
    user = User.first_or_create(uid: auth[:uid]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
    end
    session[:user_id] = user.id
  end

  def auth
    request.env['omniauth.auth']
  end
end
