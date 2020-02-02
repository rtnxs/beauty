Rails.application.routes.draw do
  resources :expenses
  resources :types
  root 'visits#index'
  resources :services
  resources :visits
  resources :clients

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
end
