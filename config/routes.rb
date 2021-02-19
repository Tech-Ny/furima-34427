Rails.application.routes.draw do
  devise_for :users
  #get 'cards/new'
  #get 'users/show'
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
 
  resources :users, only: [:show, :update]
  
  resources :cards, only: [:new, :create]

end
