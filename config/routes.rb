Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bikes, only: [:show, :new, :create]
  end

  resources :bikes, only: [:edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
