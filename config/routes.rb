Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: [:new, :create, :show]
  #resources :users, only: [:show]
  devise_for :users
 end
