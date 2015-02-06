Rails.application.routes.draw do

  # Authentication
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
  
  # Members
  resources :members
  
  # Settings
  get  'association', to: 'settings#association'
  get  'settings',    to: 'settings#index'
  post 'settings',    to: 'settings#update'

  root 'members#index'

end
