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

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  get 'searchuser', to: "users#search", as: "search_user"
end
