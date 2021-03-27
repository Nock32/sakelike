Rails.application.routes.draw do
  get 'reviews/show'
  devise_for :users
  root to: "brewers#index"
  resources :users, only: [:edit, :update]
 
  # resources :homes, only: [:index]
  resources :brewers do
  
    resources :items , shallow: true
      # resources :reviews 
  
  end


end
