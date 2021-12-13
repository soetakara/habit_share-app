Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "rooms#index"

  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
    resources :habits, only: [:new, :create]
  end
  resources :users, only: [:index]
end
