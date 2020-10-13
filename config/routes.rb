Rails.application.routes.draw do
  root to: 'static#welcome'
  get 'static/welcome'

  resources :contributions
  resources :shows
  resources :users
  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  
  resources :sessions
end
