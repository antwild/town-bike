Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bikes, only: [:show, :new, :create]
  end

  resources :bikes, only: [:index, :edit, :update, :destroy] do
    resources :bookings, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
