Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :events
  resources :products
end
