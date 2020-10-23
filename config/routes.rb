Rails.application.routes.draw do
  
  root to: 'products#index'
  devise_for :users
  resources :products do
    resources :reviews
  end
end
