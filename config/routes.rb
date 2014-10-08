Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'posts#index'

  resources :posts
  resources :events
  resources :products

  get '/about',   to: 'about#about',   as: 'about'
  get '/contact', to: 'about#contact', as: 'contact'
end
