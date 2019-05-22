Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
  end

  resources :bikes
  resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :payments, only: [:new, :create]
  end
  resources :reviews
end
