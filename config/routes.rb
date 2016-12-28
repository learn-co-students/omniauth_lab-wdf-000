Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  resources :sessions, only: [:create]
  root 'welcome#home'
end
