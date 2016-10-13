class SessionsController < ApplicationController


  def create
    if auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth[:uid], name: auth[:info][:name])
      session[:user_id] = user.id
    else
      render 'welcome/home'
    end
  end






end
