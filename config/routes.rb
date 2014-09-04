Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :events
  resources :products

  get '/about',   to: 'about#about',   as: 'about'
  get '/contact', to: 'about#contact', as: 'contact'
end
