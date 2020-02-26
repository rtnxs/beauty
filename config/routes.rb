Rails.application.routes.draw do
  root 'home#index'

  resources :staff, only: :index
  resources :expenses
  resources :types
  resources :services
  resources :visits
  resources :clients

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show edit update destroy]
end
