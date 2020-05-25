Rails.application.routes.draw do
  resources :buzzs, :except => [:edit, :show]
  root "buzzs#index"
  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'auth'
  get 'logout', to: 'sessions#destroy', as: 'logout' 

end
