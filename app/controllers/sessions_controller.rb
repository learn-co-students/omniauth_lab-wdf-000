class SessionsController < ApplicationController

  def auth
    request.env['omniauth.auth']
  end

  def new
    
  end

  def create
    if auth
      if user = User.find_by(uid: auth[:uid])
        session[:user_id] = user.id
      else
        user = User.create(name: auth[:info][:name], uid: auth[:uid], email: auth[:info][:email])
        session[:user_id] = user.id
      end
    else
      user = User.create(name: params[:name], uid: params[:id], email: params[:email])
      session[:user_id] = user.id
    end
  end

end
