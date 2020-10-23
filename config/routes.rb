Rails.application.routes.draw do
  root to: 'static#welcome'

  get '/shows/most_active', to: 'shows#most_active', as: 'most_active'

  resources :shows, only: [:index, :show] do
    resources :contributions, except: [:index]
  end
  resources :users do
    resources :shows, except: [:index]
  end

  get 'shows/:id/select', to: 'contributions#select', as: 'contribution_select'

  get 'users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/auth/facebook', as: 'facebook_login'
  get '/auth/facebook/callback' => 'sessions#create'

end
