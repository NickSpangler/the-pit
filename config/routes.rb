Rails.application.routes.draw do
  root to: 'static#welcome'
  get 'static/welcome'
  resources :users
end
