class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.name = auth['info']['name']
    end
    session[:user_id] = user.id
    redirect_to "/#{session[:user_id]}/index"
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  def auth
    request.env['omniauth.auth']
  end
end
