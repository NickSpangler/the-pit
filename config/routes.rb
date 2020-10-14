Rails.application.routes.draw do
  root to: 'static#welcome'
  get 'static/welcome'

  resources :contributions, only: [:index, :show]
  resources :shows, only: [:index, :show]
  resources :users do
    resources :shows
    resources :contributions
  end

  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'

end
