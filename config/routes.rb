Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users, only: [:edit, :update]
  resources :items
  resources :homes


end
