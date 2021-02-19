Rails.application.routes.draw do

  #get 'cards/new'
  #get 'users/show'
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end

  resources :users, only: [:show, :update]
  devise_for :users
  resources :cards, only: [:new, :create]

end
