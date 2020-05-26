Rails.application.routes.draw do
  
  root "buzzs#index"
  resources :users, :except => [:edit, :index] do
  	resources :buzzs, :except => [:edit]
  end	

  get 'feed', to:"buzzs#index"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'auth'
  get 'logout', to: 'sessions#destroy', as: 'logout' 

end
