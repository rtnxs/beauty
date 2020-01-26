Rails.application.routes.draw do
  root 'users#index'
  resources :services
  resources :visits
  resources :clients
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
