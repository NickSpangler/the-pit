Rails.application.routes.draw do
  resources :shows
  root to: 'static#welcome'
  get 'static/welcome'
  resources :users
  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  resources :sessions
end
