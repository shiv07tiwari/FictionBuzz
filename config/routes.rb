Rails.application.routes.draw do
  resources :buzzs
  root "buzzs#index"
end
