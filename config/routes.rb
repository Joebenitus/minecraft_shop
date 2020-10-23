Rails.application.routes.draw do
  
  root to: 'products#home'
  devise_for :users
  resources :products do
    resources :reviews
  end
end
