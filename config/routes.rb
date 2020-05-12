Rails.application.routes.draw do
  root 'events#index'
  #resources :events, only: [:new]
  #resources :users, only: [:show]
  devise_for :users
 end
