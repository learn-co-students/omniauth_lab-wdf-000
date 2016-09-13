class SessionsController < ApplicationController
  def new
    
  end

  def create
    # binding.pry
    user = User.find_or_create_by(:name => auth['info']['name'], :uid => auth['uid'])
     session[:user_id] = user.id
     @auth = auth
  end

   def auth
     request.env['omniauth.auth']
   end
end
