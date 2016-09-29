Rails.application.routes.draw do
  root 'welcome#home'
  resources :sessions, only: [:create]
end
