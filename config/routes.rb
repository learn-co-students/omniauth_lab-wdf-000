Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'sessions#create'
  root 'welcome#home'
  get '/sessions' => 'sessions#create'

end
