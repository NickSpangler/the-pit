Rails.application.routes.draw do
  root to: 'static#welcome'
  get 'static/welcome'
  get '/shows/most_active', to: 'shows#most_active', as: 'most_active'

  resources :contributions, only: [:index, :show]
  resources :shows, only: [:index, :show] do
    resources :contributions
  end
  resources :users do
    resources :shows
    resources :contributions
  end

  get 'shows/:id/select', to: 'contributions#select', as: 'contribution_select'

  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'

end
