Rails.application.routes.draw do
  
  resources :members

  root 'members#index'

end
