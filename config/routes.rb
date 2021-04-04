Rails.application.routes.draw do
  devise_for :users
  get 'reviews/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end
end
