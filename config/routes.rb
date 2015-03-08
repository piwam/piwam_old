Rails.application.routes.draw do

  # Accounting
  get 'accounting', to: 'accounting#index'

  # Accounts
  resources :accounts

  # Activities
  resources :activities

  # Association
  get 'association',  to: 'association#index'
  post 'association', to: 'association#update'

  # Authentication
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  # Contributions
  resources :contributions, except: :show

  # Contribution types
  resources :contribution_types, except: :show

  # Expenses
  resources :expenses

  # Exports
  get 'exports', to: 'exports#index'

  # Incomes
  resources :incomes

  # Mailings
  resources :mailings, only: [:new, :create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  # Members
  resources :members do
    resources :permissions, only: :create
    collection do
      get 'faces'
      get 'map'
    end
  end
  
  # Settings
  get  'settings', to: 'settings#index'
  post 'settings', to: 'settings#update'

  # Setup
  get  'setup', to: 'setup#new'
  post 'setup', to: 'setup#create'

  # Statuses
  resources :statuses, except: :show

  root 'members#index'

end
