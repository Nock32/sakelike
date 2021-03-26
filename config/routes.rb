Rails.application.routes.draw do
  devise_for :users
  root to: "brewers#index"
  resources :users, only: [:edit, :update]
 
  # resources :homes, only: [:index]
  resources :brewers do
    resources :items 
  end


end
