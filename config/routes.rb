Rails.application.routes.draw do
  devise_for :users
  root to: "brewers#index"
  resources :users, only: [:edit, :update]
  resources :brewers do
    resources :items , shallow: true do
      resources :reviews , shallow: true  
    end
  end
end
