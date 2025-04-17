Rails.application.routes.draw do
  devise_for :users

  resources :events, only: [ :index, :show, :new, :create ]
  resources :users, only: [ :show ]
  resources :sign_ups, only: [ :create, :destroy ]

  root "events#index"
end
