Rails.application.routes.draw do
  
  # Members
  resources :members
  
  # Settings
  get  'association', to: 'settings#association'
  get  'settings',    to: 'settings#index'
  post 'settings',    to: 'settings#update'

  root 'members#index'

end
