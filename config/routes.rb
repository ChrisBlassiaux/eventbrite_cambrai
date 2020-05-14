Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events, only: [:new, :create, :show]
  resources :users

  resources :charges, only: [:new, :create]
 end
