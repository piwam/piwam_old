Rails.application.routes.draw do

  # Setup
  get  'setup', to: 'setup#new'
  post 'setup', to: 'setup#create'

  # Authentication
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  # Accounts
  resources :accounts
  
  # Members
  resources :members do
    collection do
      get 'faces'
      get 'map'
    end
  end
  
  # Settings
  get  'association', to: 'settings#association'
  get  'settings',    to: 'settings#index'
  post 'settings',    to: 'settings#update'

  root 'members#index'

end
